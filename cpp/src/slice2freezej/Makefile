# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir	= ../..

NAME		= $(bindir)/slice2freezej

TARGETS		= $(NAME)

OBJS		= Main.o

RPATH_DIR	= $(LOADER_PATH)/../$(libsubdir)

include $(top_srcdir)/make/Make.rules

CPPFLAGS	:= -I. $(CPPFLAGS)

$(NAME): $(OBJS)
	rm -f $@
	$(CXX) $(LDFLAGS) $(LDEXEFLAGS) -o $@ $(OBJS) -lSlice -lIceUtil

install:: all
	$(call installprogram,$(NAME),$(DESTDIR)$(install_bindir))
	$(call installdata,$(top_srcdir)/../man/man1/slice2freezej.1,$(DESTDIR)$(install_mandir))
