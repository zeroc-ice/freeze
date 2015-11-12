# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir	= ..\..

!include $(top_srcdir)/make/Make.rules.mak

install::
	@if not exist "$(install_includedir)\Freeze" \
	    @echo "Creating $(install_includedir)\Freeze..." && \
	    $(MKDIR) "$(install_includedir)\Freeze"

	@for %i in ( *.h ) do \
	    @echo Installing %i && \
	    copy %i "$(install_includedir)\Freeze"
