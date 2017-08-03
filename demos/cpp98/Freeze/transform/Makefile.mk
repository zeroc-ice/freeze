# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

$(demo)_programs := create read recreate readnew

$(demo)_create_sources          := ContactData.ice create.cpp
$(demo)_create_slice2freeze     := Contacts

$(demo)_read_sources            := ContactData.ice read.cpp
$(demo)_read_slice2freeze       := Contacts

$(demo)_recreate_sources        := NewContactData.ice recreate.cpp
$(demo)_recreate_slice2freeze   := NewContacts

$(demo)_readnew_sources         := NewContactData.ice readnew.cpp
$(demo)_readnew_slice2freeze    := NewContacts

$(demo)_slice2freeze            := Contacts NewContacts

$(demo)_Contacts                := --dict "Demo::Contacts,string,Demo::ContactData,sort" \
                                   --dict-index "Demo::Contacts,phoneNumber,sort"
$(demo)_Contacts_slice          := $(demo)/ContactData.ice

$(demo)_NewContacts             := --dict "Demo::NewContacts,string,Demo::ContactData,sort" \
                                   --dict-index "Demo::NewContacts,phoneNumber,sort"
$(demo)_NewContacts_slice       := $(demo)/NewContactData.ice

demos += $(demo)
