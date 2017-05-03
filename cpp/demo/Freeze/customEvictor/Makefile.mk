# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources          = Item.ice Client.cpp

$(test)_server_sources          = Item.ice \
                                  ItemInfo.ice \
                                  ItemI.cpp \
                                  CurrentDatabase.cpp \
                                  Evictor.cpp \
                                  EvictorBase.cpp \
                                  Server.cpp \
                                  SimpleEvictor.cpp

$(test)_server_slice2freeze     := Database
$(test)_server_Database         := --dict Database,string,Warehouse::ItemInfo
$(test)_server_Database_slice   := $(test)/ItemInfo.ice


demos += $(test)
