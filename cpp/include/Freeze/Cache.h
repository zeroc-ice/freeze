// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef FREEZE_CACHE_H
#define FREEZE_CACHE_H

#include <IceUtil/IceUtil.h>
#include <IceUtil/CountDownLatch.h>
#include <map>

namespace Freeze
{

//
// An abstraction to efficiently populate a Cache, without holding
// a lock while loading from a database.
//

template<typename Key, typename Value>
class Cache
{
public:
    
    //
    // Latch and CacheValue are implementation details;
    // application code should not use them.
    //

    struct Latch : public IceUtilInternal::CountDownLatch
    {
        Latch() :
            IceUtilInternal::CountDownLatch(1),
            useCount(0)
        { 
        }
        int useCount;
    };

    struct CacheValue
    {
        CacheValue(const IceUtil::Handle<Value>& o) :
            obj(o),
            latch(0)
        {
        }
        
        IceUtil::Handle<Value> obj;
        Latch* latch;
    };

    typedef typename std::map<Key, CacheValue>::iterator Position;

    IceUtil::Handle<Value> getIfPinned(const Key&, bool = false) const;

    void unpin(Position);
  
    void clear();
    size_t size() const;

    bool pin(const Key&, const IceUtil::Handle<Value>&);
    
    IceUtil::Handle<Value> pin(const Key&);
    IceUtil::Handle<Value> putIfAbsent(const Key&, const IceUtil::Handle<Value>&);

protected:

    virtual IceUtil::Handle<Value> load(const Key&) = 0;

    virtual void pinned(const IceUtil::Handle<Value>&, Position)
    {
    }
    
    virtual ~Cache()
    {
    }

private:

    IceUtil::Handle<Value> pinImpl(const Key&, const IceUtil::Handle<Value>&);

    typedef std::map<Key, CacheValue> CacheMap;
    
    IceUtil::Mutex _mutex;
    CacheMap  _map;
};


template<typename Key, typename Value> IceUtil::Handle<Value> 
Cache<Key, Value>::getIfPinned(const Key& key, bool wait) const
{
    IceUtil::Mutex::Lock sync(_mutex);

    for(;;)
    {
        typename CacheMap::const_iterator p = _map.find(key);
        if(p != _map.end())
        {
            IceUtil::Handle<Value> result = (*p).second.obj;
            if(result != 0 || wait == false)
            {
                return result;
            }
            
            //
            // The object is being loaded: we wait
            //

            if(p->second.latch == 0)
            {
                const_cast<CacheValue&>(p->second).latch = new Latch;
            }
            
            Latch* latch = p->second.latch;
            ++latch->useCount;
            sync.release();
            latch->await();
            sync.acquire();
            if(--latch->useCount == 0)
            {
                delete latch;
            }
            //
            // Try again
            //
        }
        else
        {
            return 0;
        }
    }
}

template<typename Key, typename Value> void
Cache<Key, Value>::unpin(typename Cache::Position p)
{
    //
    // There is no risk to erase a 'being loaded' position,
    // since such position never got outside yet!
    //
    IceUtil::Mutex::Lock sync(_mutex);
    _map.erase(p);
}

template<typename Key, typename Value> void 
Cache<Key, Value>::clear()
{
    //
    // Not safe during a pin!
    //
    IceUtil::Mutex::Lock sync(_mutex);
    _map.clear();
}

template<typename Key, typename Value> size_t 
Cache<Key, Value>::size() const
{
    IceUtil::Mutex::Lock sync(_mutex);
    return _map.size();
}
    
template<typename Key, typename Value> bool 
Cache<Key, Value>::pin(const Key& key, const IceUtil::Handle<Value>& obj)
{
    IceUtil::Mutex::Lock sync(_mutex);
    std::pair<typename CacheMap::iterator, bool> ir =
#ifdef _MSC_VER
       _map.insert(CacheMap::value_type(key, CacheValue(obj)));
#else
       _map.insert(typename CacheMap::value_type(key, CacheValue(obj)));
#endif       

    if(ir.second)
    {
        pinned(obj, ir.first);
    }
    return ir.second;
}

template<typename Key, typename Value> IceUtil::Handle<Value> 
Cache<Key, Value>::pin(const Key& key)
{
    return pinImpl(key, 0);
}

template<typename Key, typename Value> IceUtil::Handle<Value> 
Cache<Key, Value>::putIfAbsent(const Key& key, const IceUtil::Handle<Value>& obj)
{
    return pinImpl(key, obj);
}

template<typename Key, typename Value> IceUtil::Handle<Value> 
Cache<Key, Value>::pinImpl(const Key& key, const IceUtil::Handle<Value>& newObj)
{
    Latch* latch = 0;
    Position p;

    do
    {
        {
            IceUtil::Mutex::Lock sync(_mutex);
        
            //
            // Clean up latch from previous loop
            //
            if(latch != 0)
            {
                if(--latch->useCount == 0)
                {
                    delete latch;
                }
                latch = 0;
            }
    
            std::pair<typename CacheMap::iterator, bool> ir =
#if defined(_MSC_VER)
                _map.insert(CacheMap::value_type(key, CacheValue(0)));
#else
                _map.insert(typename CacheMap::value_type(key, CacheValue(0)));
#endif    

            if(ir.second == false)
            {
                CacheValue& val = ir.first->second;
                if(val.obj != 0)
                {
                    return val.obj;
                }

                //
                // Otherwise wait
                //
                if(val.latch == 0)
                {
                    // 
                    // The first queued thread creates the latch 
                    // 
                    val.latch = new Latch; 
                }
                latch = val.latch;
                latch->useCount++;
            }
           
            p = ir.first;          
        }
        
        if(latch != 0) 
        {
            //
            // Note: only the threads owning a "useCount" wait; upon wake-up,
            // they loop back, release this useCount and possibly delete the latch
            //
            
            latch->await();

            // 
            // p could be stale now, e.g. some other thread pinned and unpinned the 
            // object while we were waiting. 
            // So start over. 
        }
    } while(latch != 0);

    
    //
    // Load 
    //
    IceUtil::Handle<Value> obj;
    try
    {
        obj = load(key);
    }
    catch(...)
    {
        IceUtil::Mutex::Lock sync(_mutex);
        latch = p->second.latch;
        p->second.latch = 0;
        _map.erase(p);
        if(latch != 0)  
        {
            //
            // It is necessary to call countDown() within the sync
            // because countDown may not be atomic, and we don't
            // want the "await" thread to delete the latch while
            // this thread is still in countDown().
            //
            assert(latch->getCount() == 1);
            latch->countDown();
        }
        throw;
    }

    IceUtil::Mutex::Lock sync(_mutex);
    
    //
    // p is still valid here -- nobody knows about it. See also unpin().
    //
    latch = p->second.latch;
    p->second.latch = 0;
    
    try
    {
        if(obj != 0) 
        {  
            p->second.obj = obj;
            pinned(obj, p);
        } 
        else 
        { 
            if(newObj == 0)
            {
                //
                // pin() did not find the object
                //
                
                // 
                // The waiting threads will have to call load() to see by themselves. 
                // 
                _map.erase(p);
            }
            else
            {
                //
                // putIfAbsent() inserts key/newObj
                //
                p->second.obj = newObj;
                pinned(newObj, p);
            }
        }
    }
    catch(...)
    {
        if(latch != 0)  
        {  
            //
            // Must be called within sync; see ->countDown() note above.
            //
            assert(latch->getCount() == 1);
            latch->countDown();
        }
        throw;
    }
  
    if(latch != 0)  
    {
        //
        // Must be called within sync; see ->countDown() note above.
        //
        assert(latch->getCount() == 1);
        latch->countDown();
    }
    return obj;
}

}

#endif
