// **********************************************************************
//
// Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze;

public class TransactionalEvictorDeadlockException extends Ice.SystemException
{
    public TransactionalEvictorDeadlockException(Transaction transaction)
    {
        tx = transaction;
    }

    @Override
    public String
    ice_name()
    {
        return "Freeze::TransactionalEvictorDeadlockException";
    }

    public Transaction tx;
}
