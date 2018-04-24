# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_programs  := makedb

$(test)_makedb_sources := TestOld.ice \
                          makedb.cpp

tests += $(test)
