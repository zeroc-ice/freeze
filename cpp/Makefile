# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir      := ..
lang_srcdir     := $(top_srcdir)/cpp

include $(top_srcdir)/config/Make.rules
include $(lang_srcdir)/config/Make.rules

#
# Create projects for all the Slice translators from src/slice2* and load source projects.
#
projects :=
ifeq ($(filter all cpp,$(FREEZE_BIN_DIST)),)
include $(shell find $(lang_srcdir)/src -name Makefile.mk)
$(foreach t,$(wildcard $(lang_srcdir)/src/slice2*),$(eval $(call create-translator-project,$(call project,$t))))
$(call make-projects,$(projects),make-cpp-src-project,,$(filter all cpp,$(FREEZE_BIN_DIST)))
endif

#
# Create and load test projects.
#
projects :=
tests := $(call tests-without-project-makefile,cpp)
include $(shell find $(lang_srcdir)/test -name Makefile.mk)
$(foreach t,$(tests),$(eval $(call create-cpp-test-project,$(t))))
$(call make-projects,$(projects),make-cpp-test-project)
