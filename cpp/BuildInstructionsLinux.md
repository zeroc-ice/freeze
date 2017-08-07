# Building Freeze for C++ on Linux

This file describes the Freeze source distribution, including information about
compiler requirements, third-party dependencies, and instructions for building
and testing the distribution.

## C++ Build Requirements

### Operating Systems and Compilers

Freeze is expected to build and run properly on any recent Linux distribution
for x86 and x86_64, and was extensively tested using the operating systems and
compiler versions listed for our [supported platforms][1].

### Third-Party Libraries

Freeze uses [Berkeley DB][2] as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

ZeroC supplies binary packages for Berkeley DB on supported Linux
distributions that do not include them.

## Building Freeze

### Step 1: build IceXML and testcommon in the ice submodule

Edit `freeze/ice/config/Make.rules` to establish your build configuration.
The comments in the file provide more information.

    cd freeze/ice/cpp
    make -j8 src/IceXML

### Step 2: build Freeze

Edit `freeze/config/Make.rules` to establish your build configuration.
The comments in the file provide more information.

    cd freeze/cpp
    make -j8

This builds the Freeze library, the FreezeScript utilities, and all Freeze
tests.

## Installing a C++ Source Build

Simply run `make install`. This will install Freeze in the directory specified
by the `prefix` variable in `freeze/config/Make.rules`.

After installation, make sure that the `prefix/bin` directory is in your `PATH`.

If you choose to not embed a `runpath` into executables at build time (see your
build settings in `freeze/config/Make.rules`) or did not create a symbolic link
from the `runpath` directory to the installation directory, you also need to add
the library directory to your `LD_LIBRARY_PATH`.

On an x86 system, the library directory is:

    prefix/lib                   (RHEL, SLES, Amazon)
    prefix/lib/i386-linux-gnu    (Debian, Ubuntu)

On an x86_64 system:

    prefix/lib64                 (RHEL, SLES, Amazon)
    prefix/lib/x86_64-linux-gnu  (Debian, Ubuntu)

When compiling Freeze programs, you must pass the location of the
`prefix/include` directory to the compiler with the `-I` option, and the
location of the library directory with the `-L` option.

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    $ make test

This command is equivalent to:

    $ python allTests.py

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
