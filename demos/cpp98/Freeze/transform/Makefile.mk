# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(test)_programs := create read recreate readnew

$(test)_create_sources          := ContactData.ice create.cpp
$(test)_create_slice2freeze     := Contacts

$(test)_read_sources            := ContactData.ice read.cpp
$(test)_read_slice2freeze       := Contacts

$(test)_recreate_sources        := NewContactData.ice recreate.cpp
$(test)_recreate_slice2freeze   := NewContacts

$(test)_readnew_sources         := NewContactData.ice readnew.cpp
$(test)_readnew_slice2freeze    := NewContacts

$(test)_slice2freeze            := Contacts NewContacts

$(test)_Contacts                := --dict "Demo::Contacts,string,Demo::ContactData,sort" \
                                   --dict-index "Demo::Contacts,phoneNumber,sort"
$(test)_Contacts_slice          := $(test)/ContactData.ice

$(test)_NewContacts             := --dict "Demo::NewContacts,string,Demo::ContactData,sort" \
                                   --dict-index "Demo::NewContacts,phoneNumber,sort"
$(test)_NewContacts_slice       := $(test)/NewContactData.ice

demos += $(test)
