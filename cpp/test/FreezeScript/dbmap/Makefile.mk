# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_programs  := makedb

$(test)_makedb_sources := TestOld.ice \
                          makedb.cpp

$(test)_makedb_slice2freeze   := IntSMap

$(test)_makedb_IntSMap        := --dict IntSMap,int,::Test::S 
$(test)_makedb_IntSMap_slice  := $(test)/TestOld.ice

tests += $(test)
