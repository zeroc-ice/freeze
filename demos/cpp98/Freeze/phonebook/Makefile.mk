# **********************************************************************
#
# Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources          := PhoneBook.ice \
                                   Client.cpp \
                                   Grammar.y \
                                   Parser.cpp \
                                   RunParser.cpp \
                                   Scanner.l

$(demo)_server_sources          := PhoneBook.ice \
                                   ContactFactory.cpp \
                                   PhoneBookI.cpp \
                                   Server.cpp

$(demo)_server_slice2freeze     := NameIndex

$(demo)_collocated_sources      := PhoneBook.ice \
                                   ContactFactory.cpp \
                                   PhoneBookI.cpp \
                                   Collocated.cpp \
                                   Grammar.y \
                                   Parser.cpp \
                                   RunParser.cpp \
                                   Scanner.l

$(demo)_collocated_slice2freeze := NameIndex

$(demo)_slice2freeze            := NameIndex
$(demo)_NameIndex               := --index NameIndex,Demo::Contact,name,case-insensitive
$(demo)_NameIndex_slice         := $(demo)/PhoneBook.ice

demos += $(demo)
