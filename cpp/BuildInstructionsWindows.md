# Building Freeze for C++ on Windows

This file describes how to build Freeze for C++ from sources on Windows, and
how to test the resulting build.

ZeroC provides [Freeze binary distributions][1] for various platforms and
compilers, including Windows and Visual Studio, so building Ice from sources
is usually unncecesary.

## C++ Build Requirements

### Operating Systems and Compilers

Freeze was extensively tested using the operating systems and compiler versions
listed on [supported platforms][2].

### Third-Party Libraries

Freeze relies on [Oracle Berkeley DB][3] as its datastore.

The Freeze build system for Windows automatically downloads and installs
[Nuget][3] and Nuget packages for Berkeley DB when you build Freeze for C++.
These packages are installed in `freeze\cpp\msbuild\packages`.

## Building Freeze for C++

Open a Visual Studio command prompt. For example, with Visual Studio 2015, you
can open one of:

- VS2015 x86 Native Tools Command Prompt
- VS2015 x64 Native Tools Command Prompt

Using the first Command Prompt produces `Win32` binaries by default, while
the second Command Promt produces `x64` binaries by default.

In the Command Prompt, change to the `freeze\cpp` subdirectory:

```
cd freeze\cpp
```

Now you're ready to build Freeze:

```
msbuild msbuild\freeze.proj
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
msbuild msbuild\freeze.proj /p:ICE_BIN_DIST=all
```

You can also sign the Freeze binaries with Authenticode, by setting the following
environment variables:

 - SIGN_CERTIFICATE to your Authenticode certificate
 - SIGN_PASSWORD to the certificate password

## NuGet packages

You can create a NuGet package with the following command:

```
msbuild msbuild\ice.proj /t:NuGetPack /p:BuildAllConfigurations=yes
```

This creates `zeroc.freeze.v120\zeroc.freeze.v120.nupkg` or
`zeroc.freeze.v140\zeroc.freeze.v140.nupkg` depending on the compiler you are
using.

## Running the Test Suite

Python is required to run the test suite. After a successful source build, you
can run the tests as follows:

```
python allTests.py
```

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

## Building the Demos

Open the solution file `demo\Freeze C++ demos.sln` to build the sample programs.

Select your target configuration: Debug or Release, Win32 or x64. Right click on
the desired demo in the Solution Explorer window and select "Build".

## Running the Demos

Before running a demo, make sure you've configured your environment to use Ice
as described in the [release notes][4].

Refer to the README file in each demo directory for usage instructions.

[1]: https://zeroc.com/distributions/freeze
[2]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[3]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
[4]: https://www.nuget.org
[5]: https://doc.zeroc.com/display/Freeze37/Release+Notes
[6]: https://github.com/zeroc-ice/ice-builder-visualstudio
