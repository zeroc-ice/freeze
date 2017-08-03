# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources          = Filesystem.ice \
                                  Client.cpp \
                                  Grammar.y \
                                  Parser.cpp \
                                  Scanner.l

$(demo)_server_sources          = Filesystem.ice \
                                  PersistentFilesystem.ice \
                                  PersistentFilesystemI.cpp \
                                  Server.cpp

demos += $(demo)
