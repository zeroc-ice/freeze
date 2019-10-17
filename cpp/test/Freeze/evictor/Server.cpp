//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#include <IceUtil/IceUtil.h>
#include <TestI.h>
#include <Ice/Ice.h>
#include <TestHelper.h>

using namespace std;

class AccountFactory : public Ice::ValueFactory
{
public:

    virtual Ice::ObjectPtr
#ifndef NDEBUG
    create(const string& type)
#else
    create(const string&)
#endif
    {
        assert(type == "::Test::Account");
        return new Test::AccountI;
    }
};

class ServantFactory : public Ice::ValueFactory
{
public:

    virtual Ice::ObjectPtr
#ifndef NDEBUG
    create(const string& type)
#else
    create(const string&)
#endif
    {
        assert(type == "::Test::Servant");
        return new Test::ServantI;
    }
};

class FacetFactory : public Ice::ValueFactory
{
public:

    virtual Ice::ObjectPtr
#ifndef NDEBUG
    create(const string& type)
#else
    create(const string&)
#endif
    {
        assert(type == "::Test::Facet");
        return new Test::FacetI;
    }
};

void
allTests(const Ice::CommunicatorPtr& communicator, const string& envName)
{
    communicator->getProperties()->setProperty("Factory.Endpoints", "default -p 12010");
    Ice::ObjectAdapterPtr adapter = communicator->createObjectAdapter("Factory");

    communicator->getValueFactoryManager()->add(new ServantFactory, "::Test::Servant");
    communicator->getValueFactoryManager()->add(new FacetFactory, "::Test::Facet");
    communicator->getValueFactoryManager()->add(new AccountFactory, "::Test::Account");

    Test::RemoteEvictorFactoryPtr factory = new Test::RemoteEvictorFactoryI(envName);
    adapter->add(factory, Ice::stringToIdentity("factory"));

    adapter->activate();

    communicator->waitForShutdown();
}

class Server : public Test::TestHelper
{
public:

    void run(int, char**);
};

void
Server::run(int argc, char** argv)
{
    string envName = "db";
    Ice::CommunicatorHolder ich = initialize(argc, argv);
    allTests(communicator(), envName);
}

DEFINE_TEST(Server)
