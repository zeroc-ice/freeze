# Building Freeze for C++ on Windows

This file describes how to build Ice for C++ from sources on Windows, and how
to test the resulting build.

## Build Requirements

### Operating Systems and Compilers

Ice was extensively tested using the operating systems and compiler versions
listed for our [supported platforms][1].

The build requires the [Ice Builder for Visual Studio][5], you must install
version 4.2.0 or greater to build Ice.

### Third-Party Libraries

Freeze uses [Berkeley DB][2] as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

You do not need to build Berkeley DB yourself, as ZeroC supplies
[Nuget][3] packages.

The Freeze build system for Windows downloads and installs Nuget and these
Nuget packages when you build Freeze for C++. The third-party packages
are installed in the ``freeze/cpp/msbuild/packages`` folder.

## Building Freeze

Open a command prompt for example, when using Visual Studio 2015, you have
several alternatives:

- VS2015 x86 Native Tools Command Prompt
- VS2015 x64 Native Tools Command Prompt

Using the first configurations produces 32-bit binaries, while the second
configurations produce 64-bit binaries.

In the command window, change to the `cpp` subdirectory:

    cd cpp

Now you're ready to build Ice:

    Msbuild msbuild\freeze.proj

This will build the Freeze for C++ developer kit and the Freeze for C++ test suite.

### Building the Demos

Open the solution file `demo\Freeze C++ demos.sln` to build the sample programs.
This file was created with Visual Studio 2013 and will be converted if you are
using a newer version of Visual Studio.

Select your target configuration: Debug or Release, Win32 or x64. Right click on
the desired demo in the Solution Explorer window and select "Build".

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    python allTests.py --mode=debug --x86

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

## Running the Demos

Before running a demo, make sure you've configured your environment to use Ice
as described in the [release notes][4].

Refer to the README file in each demo directory for usage instructions.

[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
[3]: https://www.nuget.org
[4]: https://doc.zeroc.com/display/Freeze37/Release+Notes
[5]: https://github.com/zeroc-ice/ice-builder-visualstudio
