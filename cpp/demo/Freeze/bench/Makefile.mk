# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_client_sources          := Test.ice Client.cpp
$(test)_client_slice2freeze     := BenchTypes

$(test)_client_BenchTypes       := --dict "Demo::IntIntMap,int,int"                                      \
                                   --dict "Demo::Struct1Struct2Map,Demo::Struct1,Demo::Struct2"          \
                                   --dict "Demo::Struct1Class1Map,Demo::Struct1,Demo::Class1"            \
                                   --dict "Demo::Struct1ObjectMap,Demo::Struct1,Object"                  \
                                   --dict "Demo::IndexedIntIntMap,int,int"                               \
                                   --dict-index "Demo::IndexedIntIntMap"                                 \
                                   --dict "Demo::IndexedStruct1Struct2Map,Demo::Struct1,Demo::Struct2"   \
                                   --dict-index "Demo::IndexedStruct1Struct2Map,s,case-insensitive"      \
                                   --dict-index "Demo::IndexedStruct1Struct2Map,s1"                      \
                                   --dict "Demo::IndexedStruct1Class1Map,Demo::Struct1,Demo::Class1"     \
                                   --dict-index "Demo::IndexedStruct1Class1Map,s,case-sensitive"

$(test)_client_BenchTypes_slice := $(test)/Test.ice


demos += $(test)
