//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#include <IceUtil/IceUtil.h>
#include <Freeze/Freeze.h>
#include <TestHelper.h>

using namespace std;
using namespace Ice;
using namespace Freeze;

class ClientFail : public Test::TestHelper
{
public:

    void run(int, char**);
};

void
ClientFail::run(int argc, char** argv)
{
    string envName = "db";

    Ice::CommunicatorHolder ich = initialize(argc, argv);
    if(argc != 1)
    {
        envName = argv[1];
        envName += "/db";
    }

    {
        try
        {
            Freeze::createConnection(communicator(), envName);
            test(false);
        }
        catch(const IceUtil::FileLockException&)
        {
            cout << "File lock not acquired." << endl;
        }
    }
}

DEFINE_TEST(ClientFail)
