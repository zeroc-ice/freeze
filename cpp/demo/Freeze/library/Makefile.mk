# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources		:= Library.ice \
				   Client.cpp \
				   Grammar.y \
				   Parser.cpp \
				   RunParser.cpp \
				   Scanner.l

$(test)_server_sources          := Library.ice \
				   BookFactory.cpp \
				   LibraryI.cpp \
				   Server.cpp

$(test)_server_slice2freeze	:= LibraryTypes

$(test)_collocated_sources      := Library.ice \
				   Collocated.cpp \
				   Grammar.y \
				   Parser.cpp \
				   RunParser.cpp \
				   Scanner.l \
				   BookFactory.cpp \
				   LibraryI.cpp

$(test)_collocated_slice2freeze	:= LibraryTypes

$(test)_slice2freeze 		:= LibraryTypes
$(test)_LibraryTypes	  	:= --dict StringIsbnSeqDict,string,Ice::StringSeq
$(test)_LibraryTypes_slice 	:= $(ice_slicedir)/Ice/BuiltinSequences.ice $(test)/Library.ice
$(test)_LibraryTypes_flags 	:= --ice

demos += $(test)
