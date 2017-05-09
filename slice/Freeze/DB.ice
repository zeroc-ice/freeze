// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#pragma once

[["cpp:header-ext:h", "cpp:dll-export:FREEZE_API"]]

/**
 *
 * Freeze provides automatic persistence for Ice servants.
 *
 **/
module Freeze
{

/**
 *
 * A database key, represented as a sequence of bytes.
 *
 **/
sequence<byte> Key;

/**
 *
 * A database value, represented as a sequence of bytes.
 *
 **/
sequence<byte> \Value;

};
