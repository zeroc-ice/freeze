//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#include <ContactFactory.h>
#include <PhoneBookI.h>

using namespace std;

ContactFactory::ContactFactory()
{
}

Ice::ObjectPtr
#ifndef NDEBUG
ContactFactory::create(const string& type)
#else
ContactFactory::create(const string&)
#endif
{
    assert(_evictor);
    assert(type == "::Demo::Contact");
    return new ContactI(this);
}

void
ContactFactory::setEvictor(const Freeze::EvictorPtr& evictor)
{
    _evictor = evictor;
}

Freeze::EvictorPtr
ContactFactory::getEvictor() const
{
    return _evictor;
}
