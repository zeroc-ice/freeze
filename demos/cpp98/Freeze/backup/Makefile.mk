# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources                  := Client.cpp

$(test)_client_slice2freeze             := IntLongMap
$(test)_client_IntLongMap               := --dict IntLongMap,int,long

demos += $(test)
