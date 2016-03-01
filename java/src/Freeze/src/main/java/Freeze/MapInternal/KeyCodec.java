// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze.MapInternal;

interface KeyCodec<K>
{
    public abstract void encodeKey(K k, Ice.OutputStream str);
    public abstract K decodeKey(Ice.InputStream str);
}
