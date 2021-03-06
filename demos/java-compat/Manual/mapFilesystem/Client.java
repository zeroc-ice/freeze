//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Filesystem.*;

public class Client extends Ice.Application
{
    @Override
    public int
    run(String[] args)
    {
        //
        // Terminate cleanly on receipt of a signal.
        //
        shutdownOnInterrupt();

        //
        // Create a proxy for the root directory
        //
        DirectoryPrx rootDir = DirectoryPrxHelper.checkedCast(communicator().propertyToProxy("RootDir.Proxy"));
        if(rootDir == null)
        {
            throw new Error("Client: invalid proxy");
        }

        Parser p = new Parser(rootDir);
        return p.parse();
    }

    static public void
    main(String[] args)
    {
        Client app = new Client();
        app.main("demo.book.map_filesystem.Client", args, "config.client");
    }

    static private class Error extends RuntimeException
    {
        public Error(String msg)
        {
            super(msg);
        }
    }
}
