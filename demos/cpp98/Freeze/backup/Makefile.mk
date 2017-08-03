# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_client_sources                  := Client.cpp

$(demo)_client_slice2freeze             := IntLongMap
$(demo)_client_IntLongMap               := --dict IntLongMap,int,long

demos += $(demo)
