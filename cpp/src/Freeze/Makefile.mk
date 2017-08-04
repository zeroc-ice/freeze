# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(project)_libraries = Freeze
$(project)_generated_includedir := $(project)/generated/Freeze

Freeze_targetdir                := $(libdir)
Freeze_cppflags                 := -DFREEZE_API_EXPORTS
Freeze_sliceflags               := -I$(ice_slicedir) -I$(slicedir) --include-dir Freeze
Freeze_cppflags                 := -I$(includedir) -I$(includedir)/generated -I$(project)/generated -Isrc
ifeq ($(or $(filter all cpp,$(ICE_BIN_DIST)),$(filter all cpp,$(FREEZE_BIN_DIST))),)
Freeze_cppflags                 += -I$(ice_includedir)/generated -I$(ice_includedir)
else
Freeze_cppflags                 += $(if $(filter-out /usr%,$(ice_includedir)),-I$(ice_includedir))
endif

Freeze_dependencies             := Ice
Freeze_libs                     := db

Freeze_slice2freeze             := Catalog CatalogIndexList

Freeze_Catalog                  := --dict Freeze::Catalog,string,Freeze::CatalogData --dll-export FREEZE_API
Freeze_Catalog_slice            := $(slicedir)/Freeze/CatalogData.ice

Freeze_CatalogIndexList         := --dict Freeze::CatalogIndexList,string,Ice::StringSeq --dll-export FREEZE_API
Freeze_CatalogIndexList_slice   := $(ice_slicedir)/Ice/BuiltinSequences.ice

projects += $(project)
