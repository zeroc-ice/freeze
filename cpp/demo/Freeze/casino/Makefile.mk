# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources 		= Casino.ice Client.cpp

$(test)_server_sources          = Casino.ice CasinoStore.ice \
                                  BankI.cpp \
                                  BetI.cpp \
		                  BetResolver.cpp \
		                  PlayerI.cpp \
		                  Server.cpp

demos += $(test)
