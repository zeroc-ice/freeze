# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_programs := client clientFail

$(test)_client_sources       	:= Client.cpp
$(test)_clientFail_sources      := ClientFail.cpp

tests += $(test)
