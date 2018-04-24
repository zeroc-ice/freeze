// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#pragma once

[["cpp:header-ext:h", "cpp:dll-export:FREEZE_API"]]

module Freeze
{

/**
 *
 * The catalog keeps information about  Freeze Maps and Freeze
 * evictors in a Berkeley Db environment. It is used by FreezeScript.
 *
 **/

struct CatalogData
{
    /**
     *
     * True if this entry describes an evictor database, false if it describes a map database.
     *
     **/
    bool evictor;

    /**
     *
     * The Slice type for the database key.
     *
     **/
    string key;

    /**
     *
     * The Slice type for the database value.
     *
     **/
    string value;
}

}
