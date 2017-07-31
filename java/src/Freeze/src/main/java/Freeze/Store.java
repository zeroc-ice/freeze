// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze;

/**
 * A base interface for retrieving persistent objects from a backing store.
 **/
public interface Store
{
    /**
     * Instantiate an object, initializing its state from a backing store.
     *
     * @param key The database key for the object to instantiate.
     *
     * @return The corresponding object, or null if no match was found.
     *
     **/
    Object load(Object key);
}
