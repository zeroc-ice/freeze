# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir	= ../..

include $(top_srcdir)/make/Make.rules

install::
	@if test ! -d $(DESTDIR)$(install_includedir)/Freeze ; \
	then \
	    echo "Creating $(DESTDIR)$(install_includedir)/Freeze..." ; \
	    $(call mkdir,$(DESTDIR)$(install_includedir)/Freeze) ; \
	fi

	@for i in *.h ; \
	do \
	    echo "Installing $$i" ; \
	    $(INSTALL_DATA) $$i $(DESTDIR)$(install_includedir)/Freeze/$$i ; \
	    chmod a+r $(DESTDIR)$(install_includedir)/Freeze/$$i ; \
	done
