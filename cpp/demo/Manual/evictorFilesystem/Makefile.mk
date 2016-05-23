# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources 		= Filesystem.ice \
                                  Client.cpp \
		                  Grammar.y \
		                  Parser.cpp \
		                  Scanner.l

$(test)_server_sources          = Filesystem.ice \
                                  PersistentFilesystem.ice \
                                  PersistentFilesystemI.cpp \
		                  Server.cpp

demos += $(test)
