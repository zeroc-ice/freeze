// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Freeze.fileLock;

public class ClientFail extends test.TestHelper
{
    @Override
    public void run(String[] args)
    {
        Ice.StringSeqHolder argsH = new Ice.StringSeqHolder(args);
        Ice.Properties properties = createTestProperties(argsH);
        try(Ice.Communicator communicator = initialize(properties))
        {
            String envName = "db";
            if(argsH.value.length > 0)
            {
                envName = argsH.value[0];
                envName += "/";
                envName += "db";
            }

            System.out.println("create createConnection");
            Freeze.Util.createConnection(communicator, envName);
            test(false);
        }
        catch(Freeze.FileLockException ex)
        {
            System.out.println("File lock not acquired.");
        }
    }
}
