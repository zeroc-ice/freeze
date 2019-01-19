#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

$(demo)_client_sources          = Item.ice Client.cpp

$(demo)_server_sources          = Item.ice \
                                  ItemInfo.ice \
                                  ItemI.cpp \
                                  CurrentDatabase.cpp \
                                  Evictor.cpp \
                                  EvictorBase.cpp \
                                  Server.cpp \
                                  SimpleEvictor.cpp

$(demo)_server_slice2freeze     := Database
$(demo)_server_Database         := --dict Database,string,Warehouse::ItemInfo
$(demo)_server_Database_slice   := $(demo)/ItemInfo.ice

demos += $(demo)
