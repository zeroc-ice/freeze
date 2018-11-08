# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

import os

from Util import *

class TransformDB(ProcessFromBinDir, SimpleClient):

    def __init__(self):
        SimpleClient.__init__(self, exe="transformdb", quiet=True)

class FreezeCppMapping(CppMapping):

    def getEnv(self, process, current):
        env = CppMapping.getEnv(self, process, current)
        if isinstance(platform, Windows):
            env["PATH"] += os.pathsep + ice.getLibDir(process, process.getMapping(current), current)
            env["PATH"] += os.pathsep + os.path.join(toplevel, "ice", "cpp", "test", "Common", "msbuild",
                                                     current.config.buildPlatform,
                                                     current.config.buildConfig)
        return env

class FreezeJavaMapping(JavaCompatMapping):

    def getJavaArgs(self, process, current):
        args = JavaCompatMapping.getJavaArgs(self, process, current)
        if process.isFromBinDir():
            return args
        return args + ["-Djava.library.path={0}".format(self.getBerkeleyDB(process, current))]

    def getEnv(self, process, current):
        env = JavaCompatMapping.getEnv(self, process, current)
        if isinstance(platform, Windows):
            env["PATH"] = self.getBerkeleyDB(process, current) + ((os.pathsep + env["PATH"]) if "PATH" in env else "")
        return env

    def getBerkeleyDB(self, process, current):
        if isinstance(platform, Darwin):
            if os.path.exists("/usr/local/opt/ice/libexec/lib"):
                return "/usr/local/opt/ice/libexec/lib"
            else:
                return "/usr/local/opt/berkeley-db@5.3/lib"
        elif isinstance(platform, Windows):
            return os.path.join(toplevel, "java", "packages", "berkeley.db.java7.5.3.28.1", "build", "native", "bin",
                                current.config.buildPlatform)
        else:
            return "/usr/{0}".format("lib/x86_64-linux-gnu" if platform.getLinuxId() in ["ubuntu", "debian"] else "lib64")

class Ice(Component):

    def useBinDist(self, mapping, current):
        return Component._useBinDist(self, mapping, current, "ICE_BIN_DIST") or \
               Component._useBinDist(self, mapping, current, "FREEZE_BIN_DIST")

    def getInstallDir(self, mapping, current):
        if isinstance(mapping, FreezeCppMapping) and not self.useBinDist(mapping, current):
            mapping = Mapping.getByName("ice/cpp") # Use Ice from submodule
        return Component._getInstallDir(self, mapping, current, "ICE_HOME")

    def getNugetPackageVersionFile(self, mapping):
        return os.path.join(mapping.getPath(), "test", "Freeze", "complex", "msbuild", "client", "packages.config")

class Freeze(Component):

    def __init__(self):
        self.nugetVersion = None

    def useBinDist(self, mapping, current):
        return Component._useBinDist(self, mapping, current, "FREEZE_BIN_DIST")

    def getInstallDir(self, mapping, current):
        # No binary distribution on Windows, nuget package only.
        envHomeName = None if isinstance(platform, Windows) else "FREEZE_HOME"
        return Component._getInstallDir(self, mapping, current, "FREEZE_HOME")

    def getNugetPackageVersionFile(self, mapping):
        return os.path.join(mapping.getPath(), "test", "Freeze", "complex", "msbuild", "client", "packages.config")

component = Freeze()
ice = Ice()

#
# Supported mappings
#
Mapping.add("ice/cpp", CppMapping(path = os.path.join(toplevel, "ice", "cpp")), component)
Mapping.add("cpp", FreezeCppMapping(), component)
Mapping.add("java", FreezeJavaMapping(), component)
