# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir	= .

!include $(top_srcdir)/make/Make.rules.mak

INSTALL_SUBDIRS	= "$(install_bindir)" "$(install_libdir)" "$(install_includedir)"

SUBDIRS		= src include test 

install:: install-common
	@for %i in ( $(INSTALL_SUBDIRS) ) do \
	    @if not exist %i \
	        @echo "Creating %i..." && \
	        $(MKDIR) %i

	@for %i in ( src include ) do \
	    @echo "making $@ in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $@" || exit 1

install::
	@if not exist "$(install_bindir)" $(MKDIR) "$(install_bindir)"
	copy "$(DB_HOME)\build\native\bin\$(PLATFORM)\$(CONFIGURATION)\*" "$(install_bindir)"

!if "$(CONFIGURATION)" == "Debug"
#
# If that is a Debug build install also the DB tools from the release bin directory
install::
	@if not exist "$(install_bindir)" $(MKDIR) "$(install_bindir)"
	copy "$(DB_HOME)\build\native\bin\$(PLATFORM)\Release\*" "$(install_bindir)"
!endif

test::
	@python $(top_srcdir)/allTests.py

$(EVERYTHING_EXCEPT_INSTALL)::
	@for %i in ( $(SUBDIRS) ) do \
		@echo "making $@ in %i" && \
		cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $@" || exit 1
