// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#include <Freeze/Freeze.h>
#include <ComplexDict.h>
#include <TestHelper.h>
#include <NodeI.h>
#include <Parser.h>

using namespace std;
using namespace Ice;
using namespace Freeze;

//
// Don't use namespace Complex to ensure that the Complex namespace
// exists correctly.
//
// using namespace Complex;
//

static void
validate(const Complex::ComplexDict& m)
{
    cout << "testing database expressions... " << flush;
    Complex::ComplexDict::const_iterator p;
    Parser myParser;
    for(p = m.begin(); p != m.end(); ++p)
    {
        //
        // Verify the stored record is correct.
        //
        // COMPILERFIX: VC.NET reports an unhandled
        // exception if the test is written this way:
        //
        //test(p->first.result == p->second->calc());
        //
        Complex::NodePtr n = p->second;
        test(p->first.result == n->calc());

        //
        // Verify that the expression & result again.
        //
        Complex::NodePtr root = myParser.parse(p->first.expression);
        test(root->calc() == p->first.result);
    }
    cout << "ok" << endl;
}

static const char* expressions[] =
{
    "2",
    "10",
    "2+(5*3)",
    "5*(2+3)",
    "10+(10+(20+(8*(2*(3*2+4+5+6)))))"
};
static const size_t nexpressions = sizeof(expressions)/sizeof(expressions[0]);

static void
populate(Complex::ComplexDict& m)
{
    cout << "populating the database... " << flush;
    Parser myParser;
    for(size_t i = 0 ; i < nexpressions; ++i)
    {
        Complex::NodePtr root = myParser.parse(expressions[i]);
        assert(root);
        Complex::Key k;
        k.expression = expressions[i];
        k.result = root->calc();
        m.put(pair<const Complex::Key, const Complex::NodePtr>(k, root));
    }
    cout << "ok" << endl;
}

static void
allTests(int argc, char* argv[], const Ice::CommunicatorPtr& communicator, Complex::ComplexDict& m)
{
    //
    // Register a factory for the node types.
    //
    Ice::ValueFactoryPtr factory = new Complex::ValueFactoryI;
    communicator->getValueFactoryManager()->add(factory, "::Complex::NumberNode");
    communicator->getValueFactoryManager()->add(factory, "::Complex::AddNode");
    communicator->getValueFactoryManager()->add(factory, "::Complex::MultiplyNode");

    if(argc > 1 && strcmp(argv[1], "populate") == 0)
    {
        populate(m);
    }
    else if(argc > 1 && strcmp(argv[1], "validate") == 0)
    {
        validate(m);
    }
    else
    {
        test(false);
    }
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

    //
    // Scan for --dbdir command line argument.
    //
    int i = 1;
    while(i < argc)
    {
        if(strcmp(argv[i], "--dbdir") == 0)
        {
            if(i + 1 >= argc)
            {
                throw invalid_argument("missing required --dbdir argument");
            }

            envName = argv[i+1];
            envName += "/";
            envName += "db";

            //
            // Consume arguments
            //
            while(i < argc - 2)
            {
                argv[i] = argv[i+2];
                ++i;
            }
            argc -= 2;
        }
        else
        {
            ++i;
        }
    }

    Ice::CommunicatorHolder ich = initialize(argc, argv);
    Freeze::ConnectionPtr connection = createConnection(communicator(), envName);
    Complex::ComplexDict m(connection, "test");
    allTests(argc, argv, communicator(), m);
}

DEFINE_TEST(Client)
