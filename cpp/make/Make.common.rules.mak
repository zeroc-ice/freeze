# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

# ----------------------------------------------------------------------
# Don't change anything below this line!
# ----------------------------------------------------------------------

SHELL		= /bin/sh
VERSION         = 3.7.0
INTVERSION      = 3.7.0
SHORT_VERSION   = 3.7
PATCH_VERSION   = 0
SOVERSION       = 37

OBJEXT		= .obj


#
# MKDIR
#
MKDIR = md

!if "$(PLATFORM)" == "x64" || "$(PLATFORM)" == "X64" || "$(AS)" == "ml64"
x64suffix		= \x64
ARCH			= x64
PLATFORM		= x64
!elseif "$(PLATFORM)" == "ARM"
ARCH			= arm
PLATFORM		= arm
!else
ARCH			= x86
PLATFORM		= Win32
!endif

#
# Find CPP_COMPILER if set to "auto" by parent Make.rules.mak
#
!if "$(CPP_COMPILER)" == "auto"

!if "$(VISUALSTUDIOVERSION)" == "11.0"
CPP_COMPILER            = VC110
!elseif ([cl 2>&1 | findstr "Version\ 16." > nul] == 0)
CPP_COMPILER            = VC100
!elseif ([cl 2>&1 | findstr "Version\ 17." > nul] == 0)
CPP_COMPILER            = VC110
!elseif ([cl 2>&1 | findstr "Version\ 18." > nul] == 0)
CPP_COMPILER            = VC120
!elseif ([cl 2>&1 | findstr "Version\ 19." > nul] == 0)
CPP_COMPILER            = VC140
!elseif ([cl 2>&1 | findstr "Version\ 15." > nul] == 0)
!error Detected VC90
!else
!error Cannot detect C++ compiler
!endif

#!message CPP_COMPILER set to $(CPP_COMPILER)
!endif

!if "$(CPP_COMPILER)" != "" && "$(CPP_COMPILER)" != "VC100"  && \
    "$(CPP_COMPILER)" != "VC110" && "$(CPP_COMPILER)" != "VC120" && \
    "$(CPP_COMPILER)" != "VC140"
!error Invalid CPP_COMPILER setting: $(CPP_COMPILER). Must be one of: VC100, VC110, VC120, VC140
!endif

!if "$(PROCESSOR_ARCHITECTURE)" == "AMD64"
ice_bin_dist_dir = $(PROGRAMFILES) (x86)\ZeroC\Ice-$(VERSION)
!else
ice_bin_dist_dir = $(PROGRAMFILES)\ZeroC\Ice-$(VERSION)
!endif

#
# First, check if we're building a source distribution.
#
!if "$(ICE_HOME)" != ""

!if exist ("$(ICE_HOME)\cpp\bin")
ice_src_dist = 1
ice_dir = $(ICE_HOME)
ice_cpp_dir = $(ice_dir)\cpp
!endif

!else

!if exist ("$(ice_bin_dist_dir)\bin$(x64suffix)\$(slice_translator)")
ice_dir = $(ice_bin_dist_dir)
ice_cpp_dir = $(ice_dir)
!endif

!endif

!if "$(ice_dir)" == ""
!error Unable to find a valid Ice distribution, please verify ICE_HOME is properly configured and Ice is correctly installed.
!endif

PATH = $(PATH);$(ice_cpp_dir)\bin

#
# Set slicedir to the path of the directory containing the Slice files.
#
slicedir		= $(ice_dir)\slice

!if exist ($(top_srcdir)\..\slice)
install_slicedir    	= $(prefix)\slice
!endif

install_bindir		= $(prefix)\bin$(x64suffix)

all::

!if exist ($(top_srcdir)\..\ICE_LICENSE.txt)
TEXT_EXT	= .txt
!endif

install-common::
	@if not exist "$(prefix)" \
	    @echo "Creating $(prefix)..." && \
	    $(MKDIR) "$(prefix)"

!if "$(install_slicedir)" != ""
	@if not exist "$(install_slicedir)" \
            @echo "Creating $(install_slicedir)..." && \
            $(MKDIR) "$(install_slicedir)" && \
	    @echo "Copying slice files..." && \
            cmd /c "xcopy /s /y $(top_srcdir)\..\slice "$(install_slicedir)"" || exit 1
!endif

	@if not exist "$(prefix)\bin" \
            @echo "Creating $(install_bindir)..." && \
            $(MKDIR) "$(prefix)\bin"

	@if not exist "$(prefix)\ICE_LICENSE$(TEXT_EXT)" \
	    @copy $(top_srcdir)\..\ICE_LICENSE$(TEXT_EXT) "$(prefix)"
	@if not exist "$(prefix)\LICENSE$(TEXT_EXT)" \
	    @copy $(top_srcdir)\..\LICENSE$(TEXT_EXT) "$(prefix)"
