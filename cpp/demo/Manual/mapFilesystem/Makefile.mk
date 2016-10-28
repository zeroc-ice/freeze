# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources		= Filesystem.ice \
				  Client.cpp \
				  Grammar.y \
				  Parser.cpp \
				  Scanner.l

$(test)_server_sources          = Filesystem.ice \
                                  FilesystemDB.ice \
				  FilesystemI.cpp \
				  Server.cpp

$(test)_server_slice2freeze     := IdentityFileEntryMap IdentityDirectoryEntryMap

$(test)_server_IdentityFileEntryMap	  := --dict FilesystemDB::IdentityFileEntryMap,Ice::Identity,FilesystemDB::FileEntry 
$(test)_server_IdentityFileEntryMap_slice := $(test)/FilesystemDB.ice $(ice_slicedir)/Ice/Identity.ice

$(test)_server_IdentityDirectoryEntryMap       := --dict FilesystemDB::IdentityDirectoryEntryMap,Ice::Identity,FilesystemDB::DirectoryEntry  
$(test)_server_IdentityDirectoryEntryMap_slice := $(test)/FilesystemDB.ice $(ice_slicedir)/Ice/Identity.ice

demos += $(test)
