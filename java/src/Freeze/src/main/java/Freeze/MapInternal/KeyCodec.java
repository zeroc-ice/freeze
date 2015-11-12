// **********************************************************************
//
// Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze.MapInternal;

interface KeyCodec<K>
{
    public abstract void encodeKey(K k, IceInternal.BasicStream str);
    public abstract K decodeKey(IceInternal.BasicStream str);
}
