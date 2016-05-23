# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources 		:= PhoneBook.ice \
                                   Client.cpp \
		                   Grammar.y \
		                   Parser.cpp \
		                   RunParser.cpp \
		                   Scanner.l

$(test)_server_sources          := PhoneBook.ice \
                                   ContactFactory.cpp \
		                   PhoneBookI.cpp \
		                   Server.cpp

$(test)_server_slice2freeze     := NameIndex

$(test)_collocated_sources	:= PhoneBook.ice \
                                   ContactFactory.cpp \
		                   PhoneBookI.cpp \
		                   Collocated.cpp \
		                   Grammar.y \
		                   Parser.cpp \
		                   RunParser.cpp \
		                   Scanner.l

$(test)_collocated_slice2freeze	:= NameIndex

$(test)_slice2freeze 		:= NameIndex
$(test)_NameIndex        	:= --index NameIndex,Demo::Contact,name,case-insensitive
$(test)_NameIndex_slice  	:= $(test)/PhoneBook.ice

demos += $(test)
