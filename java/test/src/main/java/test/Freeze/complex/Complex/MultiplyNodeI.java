// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Freeze.complex.Complex;

public class MultiplyNodeI extends MultiplyNode
{
    public
    MultiplyNodeI()
    {
    }

    public
    MultiplyNodeI(Node left, Node right)
    {
        this.left = left;
        this.right = right;
    }

    public int
    calc(Ice.Current current)
    {
        return left.calc(current) * right.calc(current);
    }
}
