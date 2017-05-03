# Building Freeze for C++ on Windows

This file describes how to build Freeze for C++ from sources on Windows, and
how to test the resulting build.

## Build Requirements

### Operating Systems and Compilers

TBD

### Third-Party Libraries

Freeze relies on [Oracle Berkeley DB][2] as its datastore.

The Freeze build system for Windows automatically downloads and installs
[Nuget][3] and Nuget packages for Berkeley DB when you build Freeze for C++.
These packages are installed in `freeze\cpp\msbuild\packages`.

## Building Freeze for C++

Open a command prompt with the Visual Studio environment, such as:
- VS2013 x86 Native Tools Command Prompt
- VS2013 x64 Native Tools Command Prompt
- VS2015 x86 Native Tools Command Prompt
- VS2015 x64 Native Tools Command Prompt

For example, if you select `VS2015 x64 Native Tools Command Prompt`,
the build instructions below will create 64-bit binaries with VS 2015.

### Debug Build

    cd freeze\cpp
    msbuild msbuild\freeze.proj

This builds several Ice C++ components in `freeze\ice\cpp`, the Freeze
library, the FreezeScript utilities and all the Freeze tests in Debug mode.

### Release Build

    cd freeze\cpp
    msbuild msbuild\freeze.proj /p:Configuration=Release

This builds several Ice C++ components in `freeze\ice\cpp`, the Freeze
library, the FreezeScript utilities and all the Freeze tests in Release mode.
mode.

### Build All Platforms and Configurations

    cd freeze\cpp
    msbuild msbuild\freeze.proj /p:BuildAllConfigurations=yes

This builds all platforms (x64, Win32) and configurations (Debug, Release)
of several Ice C++ components in `freeze\ice\cpp`, the Freeze library, the
FreezeScript utilities and all the Freeze tests.

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    cd freeze\cpp
    python allTests.py --mode=debug|release --x86|--x64

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

[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
[3]: https://www.nuget.org
[4]: https://doc.zeroc.com/display/Freeze37/Release+Notes
[5]: https://github.com/zeroc-ice/ice-builder-visualstudio
