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
            return os.path.join(toplevel, "cpp", platform.getBinSubDir(self, process, current), exe)
        else:
            return CppMapping.getCommandLine(self, current, process, exe)

class FreezeJavaMapping(JavaCompatMapping):

    def getJavaArgs(self, process, current):
        if process.isFromBinDir():
            return []

        if isinstance(platform, Darwin):
            if os.path.exists('/usr/local/opt/ice/libexec/lib'):
                return ["-Djava.library.path=/usr/local/opt/ice/libexec/lib"]
            else:
                return ["-Djava.library.path=/usr/local/opt/berkeley-db53/lib"]
        elif isinstance(platform, Windows):
            return ["-Djava.library.path={0}".format(os.path.join(toplevel, "cpp", "msbuild", "packages",
                                                                  "berkeley.db.v140.5.3.28.3", "build", "native", "bin",
                                                                  current.config.buildConfig))]
        else:
            return ["-Djava.library.path=/usr/{0}".format(platform.getLibSubDir(self, process, current))]

Mapping.add("freeze/cpp", FreezeCppMapping(path = os.path.join(toplevel, "cpp")))
Mapping.add("freeze/java", FreezeJavaMapping(path = os.path.join(toplevel, "java")))

