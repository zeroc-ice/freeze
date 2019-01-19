//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

package Freeze;

interface PostCompletionCallback
{
    void postCompletion(boolean committed, boolean deadlock, SharedDbEnv dbEnv);
}
