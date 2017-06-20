# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(project)_programs = transformdb dumpdb

$(project)_dependencies = Freeze IceXML Ice
$(project)_libs         = db mcpp
$(project)_targetdir    := $(bindir)
$(project)_bisonflags   := --name-prefix "freeze_script_"

common_sources          = AssignVisitor.cpp \
                          Data.cpp \
                          Error.cpp \
                          Exception.cpp \
                          Functions.cpp \
                          Print.cpp \
                          Util.cpp \
                          FSParser.cpp \
                          FSScanner.l \
                          FSGrammar.y

transformdb_sources     = $(common_sources) \
                          TransformAnalyzer.cpp \
                          TransformVisitor.cpp \
                          Transformer.cpp \
                          transformdb.cpp

dumpdb_sources          = $(common_sources) \
                          DumpDescriptors.cpp \
                          DumpDB.cpp

slice_sources           := $(filter-out %Util.cpp %Ruby.cpp %Python.cpp %MD5.cpp %MD5I.cpp\
                               %Checksum.cpp,\
                                $(wildcard $(top_srcdir)/ice/cpp/src/Slice/*.cpp)) \
                           $(top_srcdir)/cpp/src/Slice/SliceUtil.cpp \
                           $(top_srcdir)/cpp/src/Slice/CPlusPlusUtil.cpp

transformdb_sources     := $(addprefix $(project)/,$(transformdb_sources)) \
                           $(slice_sources)

dumpdb_sources          := $(addprefix $(project)/,$(dumpdb_sources)) \
                           $(slice_sources)

projects += $(project)
