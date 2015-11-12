# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

#
# Select an installation base directory. The directory will be created
# if it does not exist.
#
!if "$(PREFIX)" == ""
prefix			= C:\Ice-$(VERSION)
!else
prefix			= $(PREFIX)
!endif

#
# Define OPTIMIZE as yes if you want to build with
# optimization. Otherwise Ice is build with debug information.
#
#OPTIMIZE		= yes

#
# Define if you want pdb files to be generated for optimized/release
# builds
#
#RELEASEPDBS            = yes

#
# Specify your C++ compiler, or leave unset for auto-detection.
# Supported values are: VC100, VC110, VC120, VC140
#
# CPP_COMPILER = VCxxx

#
# Define if you want the Ice DLLs to have compiler specific names.
# Will be set to yes by default when CPP_COMPILER=VC100, and unset
# otherwise
#
#UNIQUE_DLL_NAMES       = yes

#
# Define if you want the Ice DLLs and executable files to be authenticode
# signed.
#
#SIGN_CERTIFICATE	= MyCertFile.pfx
#SIGN_PASSWORD		= MyCertPassword
#SIGN_TIMESTAMPSERVER	= http://timestamp.verisign.com/scripts/timstamp.dll

# ----------------------------------------------------------------------
# Don't change anything below this line!
# ----------------------------------------------------------------------

#
# If CPP_COMPILER is not set, get Make.common.rules.mak to figure it
# out by setting CPP_COMPILER to "auto"
#
!if "$(CPP_COMPILER)" == ""
CPP_COMPILER=auto
!endif

#
# Compile scanner and grammar files?
#
!if "$(BISON_FLEX)" == ""
#BISON_FLEX             = yes
!endif

!include $(top_srcdir)\make\Make.common.rules.mak

#
# With VC100, we want unique dll names by default
#
!if "$(CPP_COMPILER)" == "VC100" && "$(UNIQUE_DLL_NAMES)" == ""
UNIQUE_DLL_NAMES        = yes
!endif

bindir			= $(top_srcdir)\bin
libdir			= $(top_srcdir)\lib
includedir		= $(top_srcdir)\include
slicedir		= $(top_srcdir)\..\slice

install_libdir	  	= $(prefix)\lib$(x64suffix)
install_includedir	= $(prefix)\include
install_configdir	= $(prefix)\config

SETARGV			= setargv.obj

#
# Compiler specific definitions
#
!include        $(top_srcdir)/make/Make.rules.msvc

!if "$(CPP_COMPILER)" == "VC140"
PLATFORMTOOLSET		= v140
libsuff                 = \vc140$(x64suffix)
!elseif "$(CPP_COMPILER)" == "VC110"
PLATFORMTOOLSET		= v110
libsuff                 = \vc110$(x64suffix)
!elseif "$(CPP_COMPILER)" == "VC100"
PLATFORMTOOLSET		= v100
libsuff                 = \vc100$(x64suffix)
!else
PLATFORMTOOLSET		= v120
libsuff			= $(x64suffix)
!endif

!if "$(UNIQUE_DLL_NAMES)" == "yes"
!if "$(CPP_COMPILER)" == "VC100"
COMPSUFFIX	= _vc100
!elseif "$(CPP_COMPILER)" == "VC110"
COMPSUFFIX  = _vc110
!elseif "$(CPP_COMPILER)" == "VC120"
COMPSUFFIX  = _vc120
!elseif "$(CPP_COMPILER)" == "VC140"
COMPSUFFIX  = _vc140
!endif
!endif

!if "$(OPTIMIZE)" != "yes"
CONFIGURATION	= Debug
LIBSUFFIX	= d
RCFLAGS		= -nologo -D_DEBUG
!else
CONFIGURATION	= Release
RCFLAGS         = -nologo
!endif

ICEUTIL_OS_LIBS         = rpcrt4.lib advapi32.lib DbgHelp.lib
ICE_OS_LIBS             = advapi32.lib ws2_32.lib Iphlpapi.lib

PKG_DIR			= $(top_srcdir)\third-party-packages

DB_VERSION		= 5.3.28.2
DB_HOME			= $(PKG_DIR)\berkeley.db.$(PLATFORMTOOLSET)
DB_CPPFLAGS		= /I"$(DB_HOME)\build\native\include"
DB_LDFLAGS		= /LIBPATH:"$(DB_HOME)\build\native\lib\$(PLATFORM)\$(CONFIGURATION)"
DB_LIBS			= libdb53$(LIBSUFFIX).lib
DB_NUPKG		= $(DB_HOME)\berkeley.db.$(PLATFORMTOOLSET).nupkg

NUGET 			= $(LOCALAPPDATA)\ZeroC\nuget\nuget.exe

$(NUGET):
	@if not exist "$(LOCALAPPDATA)\ZeroC\nuget" $(MKDIR) "$(LOCALAPPDATA)\ZeroC\nuget"
	powershell -Command "(New-Object Net.WebClient).DownloadFile('http://nuget.org/nuget.exe', '$(NUGET)')"

$(DB_NUPKG): $(NUGET)
	@if not exist "$(PKG_DIR)" $(MKDIR) "$(PKG_DIR)"
	@if exist "$(PKG_DIR)\berkeley.db.$(PLATFORMTOOLSET)" rd /s /q "$(PKG_DIR)\berkeley.db.$(PLATFORMTOOLSET)"
	$(NUGET) install berkeley.db.$(PLATFORMTOOLSET) -OutputDirectory "$(PKG_DIR)" -Version $(DB_VERSION) -ExcludeVersion

CPPFLAGS		= $(CPPFLAGS) -I"$(ice_cpp_dir)\include" -I"$(includedir)"
ICECPPFLAGS		= -I"$(ice_slicedir)" -I"$(slicedir)"
SLICE2CPPFLAGS		= $(ICECPPFLAGS) $(SLICE2CPPFLAGS)
BISONFLAGS		= -dvt

!if "$(ice_src_dist)" != ""
LDFLAGS			= $(LDFLAGS) $(PRELIBPATH)"$(ice_cpp_dir)\lib"
!else
LDFLAGS			= $(LDFLAGS) $(PRELIBPATH)"$(ice_cpp_dir)\lib$(libsuff)"
!endif

LDFLAGS			= $(LDFLAGS) $(PRELIBPATH)"$(libdir)" $(LDPLATFORMFLAGS) $(CXXFLAGS)

!if "$(ice_src_dist)" != ""
SLICEPARSERLIB		= $(ice_cpp_dir)\lib\slice$(LIBSUFFIX).lib
SLICE2CPP		= $(ice_cpp_dir)\bin\slice2cpp.exe
!else
SLICE2CPP		= $(ice_dir)\bin\slice2cpp.exe
SLICEPARSERLIB		= $(SLICE2CPP)
!endif

SLICE2FREEZE		= $(bindir)\slice2freeze.exe

MT 			= mt.exe

EVERYTHING		= all clean install depend

EVERYTHING_EXCEPT_INSTALL = all clean depend

.SUFFIXES:
.SUFFIXES: .y .l .ice .cpp .c .obj .res .rc .h .d

DEPEND_DIR = .depend.mak
SLICE_DEPEND_DIR = .depend.mak\slice

depend::


!if "$(SLICE_OBJS)" != "" || "$(OBJS)" != ""
depend::
	@del /q .depend.mak
!endif

!if "$(SLICE_OBJS)" != ""
SLICE_SRCS = $(SLICE_OBJS:.obj=.cpp)
SLICE_SRCS = $(SLICE_SRCS:.\=)

$(SLICE_SRCS): "$(SLICE2CPP)" "$(SLICEPARSERLIB)"

all:: $(SLICE_SRCS)

SLICE_OBJS_DEPEND = $(SLICE_OBJS:.obj=.d)
SLICE_OBJS_DEPEND = $(SLICE_OBJS_DEPEND:.\=.depend.mak\slice\)
depend:: $(SLICE_SRCS) $(SLICE_OBJS_DEPEND)
!endif

!if "$(BISON_FLEX_OBJS)" != ""
BISON_FLEX_SRCS = $(BISON_FLEX_OBJS:.obj=.cpp)
BISON_FLEX_SRCS = $(BISON_FLEX_SRCS:.\=)

all:: $(BISON_FLEX_SRCS)

!endif

!if "$(OBJS)" != ""
all::$(OBJS:.obj=.cpp)
OBJS_DEPEND = $(OBJS:.obj=.d)
OBJS_DEPEND = $(OBJS_DEPEND:.\=.depend.mak\)
depend:: $(OBJS:.obj=.cpp) $(RC_SRCS:.rc=.h) $(OBJS_DEPEND)
!endif

.cpp{$(DEPEND_DIR)}.d:
	@echo Generating dependencies for $<
	@$(CXX) /E $(CPPFLAGS) $(CXXFLAGS) /showIncludes $< 1>$(*F).i 2>$(*F).d && \
	cscript /NoLogo $(top_srcdir)\..\ice\config\makedepend.vbs $(*F).cpp $(top_srcdir)
	@del /q $(*F).d $(*F).i

{$(SDIR)\}.ice{$(SLICE_DEPEND_DIR)\}.d:
	@echo Generating dependencies for $<
	@"$(SLICE2CPP)" $(SLICE2CPPFLAGS) --depend $< | cscript /NoLogo $(top_srcdir)\..\ice\config\makedepend-slice.vbs $(*F).ice

.ice{$(SLICE_DEPEND_DIR)\}.d:
	@echo Generating dependencies for $<
	@"$(SLICE2CPP)" $(SLICE2CPPFLAGS) --depend $(*F).ice | cscript /NoLogo $(top_srcdir)\..\ice\config\makedepend-slice.vbs $(*F).ice

.cpp.obj::
	$(CXX) /c $(CPPFLAGS) $(CXXFLAGS) $<

.c.obj:
	$(CC) /c $(CPPFLAGS) $(CFLAGS) $<

{$(SDIR)\}.ice{$(HDIR)\}.h:
	del /q $(HDIR)\$(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(SLICE2CPPFLAGS) $<
	move $(*F).h $(HDIR)

{$(SDIR)\}.ice.cpp:
	del /q $(HDIR)\$(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(SLICE2CPPFLAGS) $<
	move $(*F).h $(HDIR)

.ice.cpp:
	del /q $(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(SLICE2CPPFLAGS) $(*F).ice


!if "$(BISON_FLEX)" == "yes"
.y.cpp:
	del /q $(*F).h $(*F).cpp
	bison $(BISONFLAGS) $<
	move $(*F).tab.c $(*F).cpp
	move $(*F).tab.h $(*F).h
	del /q $(*F).output

.l.cpp:
	flex $<
	del /q $@
	echo #include "IceUtil/ScannerConfig.h" >> $(*F).cpp
	type lex.yy.c >> $@
	del /q lex.yy.c
!endif

!if exist(.depend.mak)
!include .depend.mak
!endif

.rc.res:
	rc $(RCFLAGS) $<


all:: $(TARGETS)

!if "$(TARGETS)" != ""

clean::
	-del /q $(TARGETS)

!endif

# Suffix set, we're using a debug build.
!if "$(LIBSUFFIX)" != ""

!if "$(LIBNAME)" != ""
clean::
	-del /q $(LIBNAME:d.lib=.lib)
	-del /q $(LIBNAME)
!endif
!if "$(DLLNAME)" != ""
clean::
	-del /q $(DLLNAME:d.dll=.*)
	-del /q $(DLLNAME:.dll=.*)
!endif

!else

!if "$(LIBNAME)" != ""
clean::
	-del /q $(LIBNAME:.lib=d.lib)
	-del /q $(LIBNAME)
!endif
!if "$(DLLNAME)" != ""
clean::
	-del /q $(DLLNAME:.dll=d.*)
	-del /q $(DLLNAME:.dll=.*)
!endif

!endif


!if "$(OBJDIR)" == ""
clean::
	-del /q *.obj *.bak *.ilk *.exp *.pdb *.tds *.idb
!else
clean::
	-del /q $(OBJDIR)\*.obj $(OBJDIR)\*.bak $(OBJDIR)\*.ilk $(OBJDIR)\*.exp $(OBJDIR)\*.pdb $(OBJDIR)\*.tds $(OBJDIR)\*.idb
!endif

install::

depend::
