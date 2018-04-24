# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir      := ../..
lang_srcdir     := $(top_srcdir)/demos/cpp98

include $(lang_srcdir)/make/Make.rules

include $(shell find $(lang_srcdir) -name Makefile.mk)
$(foreach t,$(demos),$(eval $(call create-demo-project,$(t))))
$(call make-projects,$(projects))
