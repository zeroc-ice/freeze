// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Freeze.simpleFileLock;

import java.io.File;
import java.io.RandomAccessFile;
import java.io.EOFException;
import java.io.UTFDataFormatException;
import java.io.IOException;

public class ClientFail extends test.TestHelper
{
    @Override
    public void
    run(String[] argvs)
    {

        try
        {
            new Freeze.FileLock("file.lock");
            test(false);
        }
        catch(Freeze.FileLockException ex)
        {
            System.out.println("File lock not acquired.");
            //
            // Try to read the pid of the lock owner from the lock file, in Windows
            // we don't write pid to lock files.
            //
            if(!System.getProperty("os.name").startsWith("Windows"))
            {
                String pid = "";
                try
                {
                    RandomAccessFile file = new RandomAccessFile(new File("file.lock"), "r");
                    try
                    {
                        pid = file.readUTF();
                    }
                    finally
                    {
                        file.close();
                    }
                }
                catch(EOFException eofEx)
                {
                    System.out.println("exception:\n" + eofEx.toString());
                    test(false);
                }
                catch(UTFDataFormatException utfEx)
                {
                    System.out.println("exception:\n" + utfEx.toString());
                    test(false);
                }
                catch(IOException ioEx)
                {
                    System.out.println("exception:\n" + ioEx.toString());
                    test(false);
                }

                if(pid.length() == 0)
                {
                    test(false);
                }
                System.out.println("Lock owned by: " + pid);
            }
        }
    }
}
