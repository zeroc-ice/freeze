// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef FREEZE_TRANSACTION_HOLDER_H
#define FREEZE_TRANSACTION_HOLDER_H

#include <Freeze/Connection.h>
#include <Freeze/Transaction.h>

namespace Freeze
{

class FREEZE_API TransactionHolder
{
public:

    TransactionHolder(const ConnectionPtr&);

    ~TransactionHolder();

    void
    commit();

    void
    rollback();

private:

    //
    // Not implemented
    //
    TransactionHolder(const TransactionHolder&);

    TransactionHolder&
    operator=(const TransactionHolder&);

    TransactionPtr _transaction;
};

}

#endif
