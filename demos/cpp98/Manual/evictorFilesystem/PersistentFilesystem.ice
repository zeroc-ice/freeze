// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#pragma once

[["suppress-warning:deprecated"]] // for classes with operations

#include <Filesystem.ice>

module Filesystem
{
    class PersistentDirectory;

    class PersistentNode implements Node
    {
        string nodeName;
        PersistentDirectory* parent;
    }

    class PersistentFile extends PersistentNode implements File
    {
        Lines text;
    }

    dictionary<string, NodeDesc> NodeDict;

    class PersistentDirectory extends PersistentNode implements Directory
    {
        ["freeze:write"]
        void removeNode(string nm);

        NodeDict nodes;
    }
}
