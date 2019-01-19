//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#include <IceUtil/IceUtil.h>
#include <Freeze/Freeze.h>
#include <IntSMap.h>
#include <TestHelper.h>

using namespace std;
using namespace Ice;
using namespace Freeze;
using namespace Test;

void
allTests(const CommunicatorPtr& communicator, const string& envName, const string& dbName)
{
    Freeze::ConnectionPtr connection = createConnection(communicator, envName);
    IntSMap m(connection, dbName);
    m.put(IntSMap::value_type(0, S()));
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

    allTests(communicator(), envName, "default.db");
}

DEFINE_TEST(Client)
