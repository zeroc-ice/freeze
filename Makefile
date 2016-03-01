# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

SUBDIRS		= cpp java
CLEAN_SUBDIRS	= java cpp
DEPEND_SUBDIRS	= cpp
INSTALL_SUBDIRS	= cpp java

all::
	@for subdir in $(SUBDIRS); \
	do \
	    echo "making all in $$subdir"; \
	    ( cd $$subdir && $(MAKE) all ) || exit 1; \
	done

clean::
	@for subdir in $(CLEAN_SUBDIRS); \
	do \
	    echo "making clean in $$subdir"; \
	    ( cd $$subdir && $(MAKE) clean ) || exit 1; \
	done

depend::
	@for subdir in $(DEPEND_SUBDIRS); \
	do \
	    echo "making depend in $$subdir"; \
	    ( cd $$subdir && $(MAKE) depend ) || exit 1; \
	done

install::
	@for subdir in $(INSTALL_SUBDIRS); \
	do \
	    echo "making install in $$subdir"; \
	    ( cd $$subdir && $(MAKE) install ) || exit 1; \
	done

test::
	@for subdir in $(SUBDIRS); \
	do \
	    echo "making test in $$subdir"; \
	    ( cd $$subdir && $(MAKE) test ) || exit 1; \
	done

cpp::
	echo "making all in cpp";
	( cd cpp && $(MAKE) all ) || exit 1;

java::
	echo "making all in java";
	( cd java && $(MAKE) all ) || exit 1;
