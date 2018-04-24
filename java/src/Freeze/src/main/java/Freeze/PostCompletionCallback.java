// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package Freeze;

interface PostCompletionCallback
{
    void postCompletion(boolean committed, boolean deadlock, SharedDbEnv dbEnv);
}
