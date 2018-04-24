# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources          := Library.ice \
                                   Client.cpp \
                                   Grammar.y \
                                   Parser.cpp \
                                   RunParser.cpp \
                                   Scanner.l

$(demo)_server_sources          := Library.ice \
                                   BookFactory.cpp \
                                   LibraryI.cpp \
                                   Server.cpp
$(demo)_server_slice2freeze     := LibraryTypes

$(demo)_collocated_sources      := Library.ice \
                                   Collocated.cpp \
                                   Grammar.y \
                                   Parser.cpp \
                                   RunParser.cpp \
                                   Scanner.l \
                                   BookFactory.cpp \
                                   LibraryI.cpp
$(demo)_collocated_slice2freeze := LibraryTypes

$(demo)_slice2freeze            := LibraryTypes
$(demo)_LibraryTypes            := --dict StringIsbnSeqDict,string,Ice::StringSeq
$(demo)_LibraryTypes_slice      := $(ice_slicedir)/Ice/BuiltinSequences.ice $(demo)/Library.ice

demos += $(demo)
