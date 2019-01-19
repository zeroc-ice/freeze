//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

package test.Freeze.fileLock;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Client extends test.TestHelper
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

            Freeze.Connection connection = Freeze.Util.createConnection(communicator, envName);
            System.out.println("File lock acquired.");
            System.out.println("Enter some input and press enter, to release the lock and terminate the program.");
            //
            // Block the test waiting for IO, so the file lock is preserved.
            //
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            try
            {
                br.readLine();
            }
            catch(java.io.IOException ex)
            {
                System.out.println("exception:\n" + ex.toString());
                test(false);
            }
            connection.close();
            System.out.println("File lock released.");
        }
    }
}
