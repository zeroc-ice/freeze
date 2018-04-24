# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources                  := Complex.ice \
                                           Grammar.y \
                                           Scanner.l \
                                           Parser.cpp \
                                           Client.cpp

$(test)_client_slice2freeze             := ComplexDict
$(test)_client_ComplexDict              := --dict Complex::ComplexDict,Complex::Key,Complex::Node
$(test)_client_ComplexDict_slice        := $(test)/Complex.ice

tests += $(test)
