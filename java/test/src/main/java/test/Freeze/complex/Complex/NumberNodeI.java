// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Freeze.complex.Complex;

public class NumberNodeI extends NumberNode
{
    public
    NumberNodeI()
    {
    }

    public
    NumberNodeI(int number)
    {
        this.number = number;
    }

    public int
    calc(Ice.Current current)
    {
        return number;
    }
}
