// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze.MapInternal;

import Freeze.ConnectionI;

class TraceLevels
{
    TraceLevels(ConnectionI connection, String dbName)
    {
        errorPrefix = "Freeze DB DbEnv(\"" + connection.envName() + "\") Db(\"" + dbName + "\"): ";
        level = connection.trace();
        deadlockWarning = connection.deadlockWarning();
        logger = connection.getCommunicator().getLogger();
    }

    final String errorPrefix;
    final int level;
    final boolean deadlockWarning;
    final Ice.Logger logger;
}
