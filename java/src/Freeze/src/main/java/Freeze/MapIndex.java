// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze;

public interface MapIndex
{
    String name();

    void associate(String dbName, com.sleepycat.db.Database db, com.sleepycat.db.Transaction txn, boolean createDb)
        throws com.sleepycat.db.DatabaseException, java.io.FileNotFoundException;

    void init(MapIndex i);

    void close();
}
