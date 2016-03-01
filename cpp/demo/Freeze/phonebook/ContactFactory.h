// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef CONTACT_FACTORY_H
#define CONTACT_FACTORY_H

#include <Freeze/Freeze.h>

class ContactFactory : public Ice::ValueFactory
{
public:

    ContactFactory();

    //
    // Operations from ValueFactory
    //
    virtual Ice::ObjectPtr create(const std::string&);

    void
    setEvictor(const Freeze::EvictorPtr&);

    Freeze::EvictorPtr
    getEvictor() const;

private:

    Freeze::EvictorPtr _evictor;
};

typedef IceUtil::Handle<ContactFactory> ContactFactoryPtr;

#endif
