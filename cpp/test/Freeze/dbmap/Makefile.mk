#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

$(test)_client_slice2freeze := ByteIntMap IntIdentityMap IntIdentityMapWithIndex SortedMap WstringWstringMap

$(test)_client_ByteIntMap := --dict "Test::ByteIntMap,byte,int" --dict-index "Test::ByteIntMap,sort"

$(test)_client_IntIdentityMap           := --dict "Test::IntIdentityMap,int,Ice::Identity"
$(test)_client_IntIdentityMap_slice     := $(ice_slicedir)/Ice/Identity.ice

$(test)_client_IntIdentityMapWithIndex          := --dict "Test::IntIdentityMapWithIndex,int,Ice::Identity" \
                                                   --dict-index "Test::IntIdentityMapWithIndex,category"
$(test)_client_IntIdentityMapWithIndex_slice    := $(ice_slicedir)/Ice/Identity.ice

$(test)_client_SortedMap        := --dict "Test::SortedMap,int,Ice::Identity,sort" \
                                   --dict-index "Test::SortedMap,category,sort,std::greater<std::string>"
$(test)_client_SortedMap_slice  := $(ice_slicedir)/Ice/Identity.ice

$(test)_client_WstringWstringMap        := --dict 'Test::WstringWstringMap,["cpp:type:wstring"]string,["cpp:type:wstring"]string' \
                                           --dict-index "Test::WstringWstringMap"
tests += $(test)
