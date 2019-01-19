//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

package Freeze.MapInternal;

interface KeyCodec<K>
{
    public abstract void encodeKey(K k, Ice.OutputStream str);
    public abstract K decodeKey(Ice.InputStream str);
}
