# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "ice", "scripts"))
from TestUtil import *

freezeToplevel = os.path.abspath(os.path.join(toplevel, ".."))

def getJavaLibraryPath():
    if isWin32():
        if iceHome:
            return os.path.join(iceHome, "bin\\x64" if x64 else "bin")
        else:
            return os.path.join(freezeToplevel, "cpp", "third-party-packages",
                                "berkeley.db.java7", "build", "native", "bin", "x64" if x64 else "Win32")
    elif isDarwin():
        if os.path.exists('/usr/local/opt/ice/libexec/lib'):
            return "/usr/local/opt/ice/libexec/lib"
        else:
            return "/usr/local/opt/berkeley-db53/lib"
    elif isRhel() or isSles():
        libpath = ("/usr/lib64" if x64 else "/usr/lib")
        if "LD_LIBRARY_PATH" in os.environ:
            libpath = os.environ["LD_LIBRARY_PATH"] + ":" + libpath
        return libpath
    elif isUbuntu() or isDebian():
        libpath = ("/usr/lib/x86_64-linux-gnu" if x64 else "/usr/lib/i386-linux-gnu")
        if "LD_LIBRARY_PATH" in os.environ:
            libpath = os.environ["LD_LIBRARY_PATH"] + ":" + libpath
        return libpath
    return ''


def getFreezeExe(name):
    return getIceExe(name).replace(toplevel, freezeToplevel)


setTestToplevel(freezeToplevel)
setJavaLibraryPath(getJavaLibraryPath())
