# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= .

!include $(top_srcdir)/make/Make.rules.mak

INSTALL_SUBDIRS	= "$(install_bindir)" "$(install_libdir)" "$(install_includedir)" "$(install_configdir)"

SUBDIRS		= src include test 

install:: install-common
	@for %i in ( $(INSTALL_SUBDIRS) ) do \
	    @if not exist %i \
	        @echo "Creating %i..." && \
	        $(MKDIR) %i

	@for %i in ( config src include ) do \
	    @echo "making $@ in %i" && \
	    cmd /c "cd %i && $(MAKE) -nologo -f Makefile.mak $@" || exit 1

install::
	@if not exist "$(install_bindir)" $(MKDIR) "$(install_bindir)"
	copy "$(BZIP2_HOME)\build\native\bin\$(PLATFORM)\$(CONFIGURARTION)\*" "$(install_bindir)"
	copy "$(DB_HOME)\build\native\bin\$(PLATFORM)\$(CONFIGURARTION)\*" "$(install_bindir)"
	copy "$(EXPAT_HOME)\build\native\bin\$(PLATFORM)\$(CONFIGURARTION)\*" "$(install_bindir)"

!if "$(CONFIGURARTION)" == "Debug"
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
