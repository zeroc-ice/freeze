# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

SUBDIRS			= cpp java
CLEAN_SUBDIRS		= java cpp
DEPEND_SUBDIRS		= cpp java
INSTALL_SUBDIRS		= cpp java
TEST_SUBDIRS		= cpp java

all::
	@for %i in ( $(SUBDIRS) ) do \
	    @echo "making all in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) all" || exit 1

clean::
	@for %i in ( $(CLEAN_SUBDIRS) ) do \
	    @echo "making clean in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) clean" || exit 1

depend::
	@for %i in ( $(DEPEND_SUBDIRS) ) do \
	    @echo "making depend in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) depend" || exit 1

install::
	@for %i in ( $(INSTALL_SUBDIRS) ) do \
	    @echo "making install in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) install" || exit 1

test::
	@for %i in ( $(TEST_SUBDIRS) ) do \
	    @echo "making test in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) test" || exit 1

cpp::
	@echo "making all in cpp" && \
	cmd /c "cd cpp && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) all" || exit 1

java::
	@echo "making all in java" && \
	cmd /c "cd java && $(MAKE) -nologo -f Makefile.mak $(MAKEFLAGS) all" || exit 1
