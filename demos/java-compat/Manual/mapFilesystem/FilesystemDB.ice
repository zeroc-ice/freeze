//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#pragma once

#include <Filesystem.ice>
#include <Ice/Identity.ice>

module FilesystemDB
{
    struct FileEntry
    {
        string name;
        Ice::Identity parent;
        Filesystem::Lines text;
    }

    dictionary<string, Filesystem::NodeDesc> StringNodeDescDict;
    struct DirectoryEntry
    {
        string name;
        Ice::Identity parent;
        StringNodeDescDict nodes;
    }
}
