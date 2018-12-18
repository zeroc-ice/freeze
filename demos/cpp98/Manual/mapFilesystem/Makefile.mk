# **********************************************************************
#
# Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources          = Filesystem.ice \
                                  Client.cpp \
                                  Grammar.y \
                                  Parser.cpp \
                                  Scanner.l

$(demo)_server_sources          = Filesystem.ice \
                                  FilesystemDB.ice \
                                  FilesystemI.cpp \
                                  Server.cpp

$(demo)_server_slice2freeze     := IdentityFileEntryMap IdentityDirectoryEntryMap

$(demo)_server_IdentityFileEntryMap       := --dict FilesystemDB::IdentityFileEntryMap,Ice::Identity,FilesystemDB::FileEntry
$(demo)_server_IdentityFileEntryMap_slice := $(demo)/FilesystemDB.ice $(ice_slicedir)/Ice/Identity.ice

$(demo)_server_IdentityDirectoryEntryMap       := --dict FilesystemDB::IdentityDirectoryEntryMap,Ice::Identity,FilesystemDB::DirectoryEntry
$(demo)_server_IdentityDirectoryEntryMap_slice := $(demo)/FilesystemDB.ice $(ice_slicedir)/Ice/Identity.ice

demos += $(demo)
