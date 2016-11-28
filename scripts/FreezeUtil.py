# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

import os, sys
from Util import *

toplevel = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

class TransformDB(SimpleClient):

    def __init__(self):
        SimpleClient.__init__(self, exe="transformdb", quiet=True)

class FreezeCppMapping(CppMapping):

    def getCommandLine(self, current, process, exe):
        if isinstance(process, TransformDB):
            return os.path.join(toplevel, "cpp", platform.getBinSubDir(self, current), exe)
        else:
            return CppMapping.getCommandLine(self, current, process, exe)

class FreezeJavaMapping(JavaCompatMapping):
    pass

Mapping.add("freeze/cpp", FreezeCppMapping(path = os.path.join(toplevel, "cpp")))
Mapping.add("freeze/java", FreezeJavaMapping(path = os.path.join(toplevel, "java")))

