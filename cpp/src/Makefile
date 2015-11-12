# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

top_srcdir	= ..

include $(top_srcdir)/make/Make.rules

SUBDIRS	= slice2freeze \
	  slice2freezej \
	  Freeze \
	  FreezeScript

.PHONY: $(EVERYTHING) $(SUBDIRS)

#
# Dependencies for 'all' target when using -jx
#

Freeze: slice2freeze

FreezeScript: Freeze

all:: $(SUBDIRS)

$(SUBDIRS):
	@echo "making all in $@"
	@$(MAKE) all --directory=$@

$(EVERYTHING_EXCEPT_ALL)::
	@for subdir in $(SUBDIRS); \
        do \
            if test -d $$subdir ; \
            then \
                echo "making $@ in $$subdir"; \
                ( cd $$subdir && $(MAKE) $@ ) || exit 1; \
            fi; \
        done
