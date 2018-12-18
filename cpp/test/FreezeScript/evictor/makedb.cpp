// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#include <Freeze/Freeze.h>
#include <TestOld.h>
#include <TestHelper.h>

using namespace std;
using namespace Test;

#ifdef __SUNPRO_CC
#   pragma error_messages(off,hidef)
#endif

class MainObjectI : public MainObject, public IceUtil::AbstractMutexI<IceUtil::Mutex>
{
};

class DerivedMainObjectI : public DerivedMainObject, public IceUtil::AbstractMutexI<IceUtil::Mutex>
{
};

class FacetObjectI : public FacetObject, public IceUtil::AbstractMutexI<IceUtil::Mutex>
{
};

class DerivedFacetObjectI : public DerivedFacetObject, public IceUtil::AbstractMutexI<IceUtil::Mutex>
{
};

class Factory : public Ice::ValueFactory
{
public:

    virtual Ice::ObjectPtr
    create(const string& type)
    {
        if(type == "::Test::MainObject")
        {
            return new MainObjectI;
        }
        else if(type == "::Test::DerivedMainObject")
        {
            return new DerivedMainObjectI;
        }
        else if(type == "::Test::FacetObject")
        {
            return new FacetObjectI;
        }
        else if(type == "::Test::DerivedFacetObject")
        {
            return new DerivedFacetObjectI;
        }
        assert(false);
        return 0;
    }
};

void
allTests(const Ice::CommunicatorPtr& communicator, const string& envName, const string& dbName)
{
    Ice::ValueFactoryPtr factory = new Factory;
    communicator->getValueFactoryManager()->add(factory, "");

    Ice::ObjectAdapterPtr adapter = communicator->createObjectAdapter("");
    Freeze::EvictorPtr evictor = Freeze::createBackgroundSaveEvictor(adapter, envName, dbName);

    for(int i = 0; i < 10; ++i)
    {
        string facetName = "theFacet";

        Ice::Identity id;
        ostringstream ostr;
        ostr << "mainObject" << i;
        id.name = ostr.str();

        if((i % 2) == 0)
        {
            MainObjectPtr obj = new MainObjectI;
            obj->boolToString = true;
            obj->byteToShort = 0;
            obj->shortToByte = 255;
            obj->intToShort = 32767;
            obj->longToInt = 2147483647;
            obj->floatToString = 4567.8f;
            obj->doubleToFloat = 8765.4;
            obj->stringToEnum = "E1";
            obj->renamed = E2;
            evictor->add(obj, id);
            FacetObjectPtr facet = new FacetObjectI;
            facet->doubleToString = 901234.5;
            evictor->addFacet(facet, id, facetName);
        }
        else
        {
            DerivedMainObjectPtr obj = new DerivedMainObjectI;
            obj->boolToString = false;
            obj->byteToShort = 0;
            obj->shortToByte = -1;
            obj->intToShort = -32768;
            obj->longToInt = -2147483647 - 1;
            obj->floatToString = -4567.8f;
            obj->doubleToFloat = -8765.4;
            obj->stringToEnum = "E3";
            obj->renamed = E1;
            obj->name = id.name;
            evictor->add(obj, id);
            DerivedFacetObjectPtr facet = new DerivedFacetObjectI;
            facet->doubleToString = -901234.5;
            facet->count = i;
            evictor->addFacet(facet, id, facetName);
        }
    }

    evictor->deactivate("");
}

class Client : public Test::TestHelper
{
public:

    void run(int, char**);
};

void
Client::run(int argc, char** argv)
{
    string envName = "db";

    Ice::CommunicatorHolder ich = initialize(argc, argv);
    if(argc != 1)
    {
        envName = argv[1];
        envName += "/";
        envName += "db";
    }

    allTests(communicator(), envName, "evictor.db");
}

DEFINE_TEST(Client)
