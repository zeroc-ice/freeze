# **********************************************************************
#
# Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources          = Casino.ice Client.cpp

$(demo)_server_sources          = Casino.ice CasinoStore.ice \
                                  BankI.cpp \
                                  BetI.cpp \
                                  BetResolver.cpp \
                                  PlayerI.cpp \
                                  Server.cpp

demos += $(demo)
