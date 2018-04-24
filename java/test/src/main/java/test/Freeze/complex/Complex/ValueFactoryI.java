// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Freeze.complex.Complex;

public class ValueFactoryI implements Ice.ValueFactory
{
    public Ice.Object
    create(String type)
    {
        if(type.equals("::Complex::MultiplyNode"))
        {
            return new MultiplyNodeI();
        }
        if(type.equals("::Complex::AddNode"))
        {
            return new AddNodeI();
        }
        if(type.equals("::Complex::NumberNode"))
        {
            return new NumberNodeI();
        }

        System.err.println( "create: " + type);
        assert(false);
        return null;
    }
}
