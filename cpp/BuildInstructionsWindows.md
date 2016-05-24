# Building Freeze for C++ on Windows

This file describes how to build Freeze for C++ from sources on Windows, and
how to test the resulting build.

## Build Requirements

### Operating Systems and Compilers

TBD

### Third-Party Libraries

Freeze uses [Berkeley DB][2] as its underlying database and requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

You do not need to build Berkeley DB yourself, as ZeroC supplies
[Nuget][3] packages.

The Freeze build system for Windows downloads and installs Nuget and these
Nuget packages when you build Freeze for C++. The third-party packages
are installed in the ``freeze/cpp/msbuild/packages`` folder.

## Building Freeze for C++

Open a command prompt with the Visual Studio environment, such as:
- VS2013 x86 Native Tools Command Prompt
- VS2013 x64 Native Tools Command Prompt
- VS2015 x86 Native Tools Command Prompt
- VS2015 x64 Native Tools Command Prompt

For example, if you select `VS2015 x64 Native Tools Command Prompt`,
the build instructions below will create 64-bit binaries with VS 2015.

### Step 1: build IceXML for C++ in the ice submodule

Debug build with VS 2015:

    cd freeze\ice\cpp
    msbuild msbuild\ice.v140.sln /t:C++98\icexml:Rebuild /m
    msbuild msbuild\ice.test.sln /t:Common\testcommon:Rebuild /m

Release build with VS 2015:

    cd freeze\ice\cpp
    msbuild msbuild\ice.v140.sln /t:C++98\icexml:Rebuild /p:Configuration=Release /m
    msbuild msbuild\ice.test.sln /t:Common\testcommon:Rebuild /p:Configuration=Release /m

To build with VS 2013, replace `v140` by `v120` in the instructions above.

### Step 2: build Freeze for C++

Debug build:

    cd freeze\cpp
    msbuild msbuild\freeze.proj

Release build:

    cd freeze\cpp
    msbuild msbuild\freeze.proj /p:Configuration=Release

This will build the Freeze for C++ developer kit and the Freeze for C++ test 
suite.

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    python allTests.py --mode=debug --x86

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
