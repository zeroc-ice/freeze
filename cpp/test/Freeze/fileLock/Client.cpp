// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#include <IceUtil/IceUtil.h>
#include <Freeze/Freeze.h>
#include <TestHelper.h>

using namespace std;
using namespace Ice;
using namespace Freeze;

class Client : Test::TestHelper
{
public:

    void run(int, char**);
};

void
Client::run(int argc, char* argv[])
{
    string envName = "db";

    Ice::CommunicatorHolder ich = initialize(argc, argv);
    if(argc != 1)
    {
        envName = argv[1];
        envName += "/db";
    }

    {
        Freeze::ConnectionPtr connection = Freeze::createConnection(communicator(), envName);

        cout << "File lock acquired.\n"
             << "Enter some input and press enter, to release the lock and terminate the program." << endl;
        //
        // Block the test waiting for IO, so the file lock is preserved.
        //
        string foo;
        cin >> foo;

        //
        // Clean up.
        //
        connection->close();
    }
    cout << "File lock released." << endl;
}

DEFINE_TEST(Client)
