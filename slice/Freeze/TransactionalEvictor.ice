// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#pragma once

[["cpp:header-ext:h", "cpp:dll-export:FREEZE_API"]]

#include <Freeze/Evictor.ice>

module Freeze
{

local interface Transaction;

/**
 *
 * A transactional evictor is an evictor that performs every single read-write
 * operation within its own transaction.
 *
 **/
local interface TransactionalEvictor extends Evictor
{
    /**
     *
     * Get the transaction associated with the calling thread.
     *
     * @return The transaction associated with the calling thread.
     *
     **/
    ["cpp:const"] Transaction getCurrentTransaction();

    /**
     *
     * Associate a transaction with the calling thread.
     *
     * @param tx The transaction to associate with the calling thread.
     *
     **/
    void setCurrentTransaction(Transaction tx);
}

}
