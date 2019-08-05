# Building Freeze for C++

This file describes how to build Freeze for C++ from source and how to test the
resulting build.

ZeroC provides [Freeze binary distributions][1] for many platforms and compilers,
including Windows and Visual Studio, so building Freeze from source is usually
unnecessary.

* [C++ Build Requirements](#c-build-requirements)
  * [Linux](#linux)
  * [macOS](#macos)
  * [Windows](#windows)
* [Building Freeze for Linux or macOS](#building-freeze-for-linux-or-macos)
* [Building Freeze for Windows](#building-freeze-for-windows)
* [Installing a C++ Source Build on Linux or macOS](#installing-a-c-source-build-on-linux-or-macos)
* [Creating a NuGet Package on Windows](#creating-a-nuget-package-on-windows)
* [Running the Test Suite](#running-the-test-suite)

## C++ Build Requirements

Freeze was extensively tested using the operating systems and compiler versions
listed on [supported platforms][2].

Freeze uses [Berkeley DB][3] as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

### Linux

ZeroC supplies binary packages for Berkeley DB on supported Linux
distributions that do not include them.

### macOS

You can install Berkeley DB with Homebrew as follows:
```
brew install zeroc-ice/tap/berkeley-db@5.3
```

### Windows

The Freeze build system for Windows automatically downloads and installs
NuGet and NuGet packages for Berkeley DB when you build Freeze for C++.
These packages are installed in `freeze\cpp\msbuild\packages`.

## Building Freeze for Linux or macOS

### Step 1: build IceXML and TestCommon in the ice submodule

If `freeze/ice` is an empty directory, fetch the `ice` submodule with:
```
cd freeze
git submodule update --init
```

Edit `freeze/ice/config/Make.rules` to establish your build configuration. The
comments in the file provide more information.
```
 cd freeze/ice/cpp
 make -j8 src/IceXML TestCommon
```

### Step 2: build Freeze

Edit `freeze/config/Make.rules` to establish your build configuration. The
comments in the file provide more information.
```
cd freeze/cpp
make -j8
```

This builds the Freeze library, the FreezeScript utilities, and all Freeze
tests.

## Building Freeze for Windows

Open a Visual Studio command prompt. For example, with Visual Studio 2015, you
can open one of:

- VS2015 x86 Native Tools Command Prompt
- VS2015 x64 Native Tools Command Prompt

Using the first Command Prompt produces `Win32` binaries by default, while
the second Command Promt produces `x64` binaries by default.

If `freeze\ice` is an empty directory, change to the `freeze` directory and
fetch the `ice` submodule:
```
cd freeze
git submodule update --init
```

Change to the `freeze\cpp` subdirectory:
```
cd freeze\cpp
```

Now you're ready to build Freeze:
```
msbuild /m msbuild\freeze.proj
```

This builds several Ice C++ components in `freeze\ice\cpp`, the Freeze
library, the FreezeScript utilities and all the Freeze tests in Release
mode.

Set the MSBuild `Configuration` property to `Debug` to build debug binaries
instead:
```
msbuild msbuild\freeze.proj /p:Configuration=Debug
```

The `Configuration` property may be set to `Debug` or `Release`.

Set the MSBuild `Platform` property to `Win32` or `x64` to build binaries
for a specific platform, for example:
```
msbuild msbuild\freeze.proj /p:Configuration=Debug /p:Platform=x64
```

You can also skip the build of the test suite with the `BuildDist` target:
```
msbuild msbuild\freeze.proj /t:BuildDist /p:Platform=x64
```

To build the test suite using the NuGet binary distribution use:
```
msbuild msbuild\freeze.proj /p:FREEZE_BIN_DIST=all
```

You can also sign the Freeze binaries with Authenticode, by setting the following
environment variables:
 - SIGN_CERTIFICATE to your Authenticode certificate
 - SIGN_PASSWORD to the certificate password

## Installing a C++ Source Build on Linux or macOS

Simply run `make install`. This will install Freeze in the directory specified
by the `prefix` variable in `freeze/config/Make.rules`.

After installation, make sure that the `prefix/bin` directory is in your `PATH`.

When compiling Freeze programs, you must pass the location of the
`prefix/include` directory to the compiler with the `-I` option, and the
location of the library directory with the `-L` option.

## Creating a NuGet Package on Windows

You can create a NuGet package with the following command:
```
msbuild msbuild\ice.proj /t:NuGetPack /p:BuildAllConfigurations=yes
```

This creates `zeroc.freeze.v120\zeroc.freeze.v120.nupkg` or
`zeroc.freeze.v140\zeroc.freeze.v140.nupkg` depending on the compiler you are
using.

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:
```
python allTests.py
```

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

[1]: https://zeroc.com/downloads/ice
[2]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.3
[3]: https://www.oracle.com/database/berkeley-db/index.html
