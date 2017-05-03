// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef FREEZE_ABSTRACT_MUTEX_H
#define FREEZE_ABSTRACT_MUTEX_H

#include <IceUtil/IceUtil.h>

//
// We keep these AbstractMutexes in namespace IceUtil for backwards compatibility
// with prior Ice/Freeze releases
//
namespace IceUtil
{

class FREEZE_API AbstractMutex
{
public:

    typedef LockT<AbstractMutex> Lock;
    typedef TryLockT<AbstractMutex> TryLock;

    virtual ~AbstractMutex()
    {
    }

    virtual void lock() const = 0;
    virtual void unlock() const = 0;
    virtual bool tryLock() const = 0;
};

template <typename T>
class AbstractMutexI : public AbstractMutex, public T
{
public:

    typedef LockT<AbstractMutexI> Lock;
    typedef TryLockT<AbstractMutexI> TryLock;

    virtual void lock() const
    {
        T::lock();
    }

    virtual void unlock() const
    {
        T::unlock();
    }

    virtual bool tryLock() const
    {
        return T::tryLock();
    }

    virtual ~AbstractMutexI()
    {}
};

template <typename T>
class AbstractMutexReadI : public AbstractMutex, public T
{
public:

    typedef LockT<AbstractMutexReadI> Lock;
    typedef TryLockT<AbstractMutexReadI> TryLock;

    virtual void lock() const
    {
        T::readLock();
    }

    virtual void unlock() const
    {
        T::unlock();
    }

    virtual bool tryLock() const
    {
        return T::tryReadLock();
    }

    virtual ~AbstractMutexReadI()
    {}
};

template <typename T>
class AbstractMutexWriteI : public AbstractMutex, public T
{
public:

    typedef LockT<AbstractMutexWriteI> Lock;
    typedef TryLockT<AbstractMutexWriteI> TryLock;

    virtual void lock() const
    {
        T::writeLock();
    }

    virtual void unlock() const
    {
        T::unlock();
    }

    virtual bool tryLock() const
    {
        return T::tryWriteLock();
    }

    virtual ~AbstractMutexWriteI()
    {}
};

}

#endif
