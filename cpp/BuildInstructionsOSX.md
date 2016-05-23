# Building Freeze for C++ on OS X

This file describes the Freeze source distribution, including information about
compiler requirements, third-party dependencies, and instructions for building
and testing the distribution.

## C++ Build Requirements

### Operating Systems and Compilers

TBD

### Third-Party Libraries

Freeze uses [Berkeley DB][2] as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

You can install Berkeley DB with [Homebrew][3] as follows:

    brew tap zeroc-ice/tap
    brew install berkeley-db53 [--without-java]

  The `berkeley-db53` package is a pre-compiled bottle that includes Java
  support by default; you can exclude Java support using the `--without-java`
  option.

## Building Freeze

### Step 1: build IceXML and testcommon in the ice submodule

Edit `freeze/ice/config/Make.rules` to establish your build configuration. 
The comments in the file provide more information.

    cd freeze/ice/cpp
    make -j8 src/IceXML test/Common

### Step 2: build Freeze

    cd freeze/cpp
    make -j8

This builds the Freeze library, the FreezeScript utilities, and all Freeze 
tests and demos.

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    python allTests.py

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

## Running the Demos

Before running a demo, make sure you've configured your environment to use Ice
as described in the [release notes][4].

Refer to the README file in each demo directory for usage instructions.

## Installing a C++ Source Build

Simply run `make install`. This will install Freeze in the directory specified by
the `prefix` variable in `freeze/ice/config/Make.rules`.

After installation, make sure that the `<prefix>/bin` directory is in your
`PATH`.

If you choose to not embed a `runpath` into executables at build time (see your
build settings in `freeze/ice/config/Make.rules`) or did not create a symbolic link 
from the `runpath` directory to the installation directory, you also need to add the
library directory to your `DYLD_LIBRARY_PATH`.

When compiling Freeze programs, you must pass the location of the
`<prefix>/include` directory to the comer with the `-I` option, and the
location of the library directory with the `-L` option.


[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
[3]: http://brew.sh
[4]: https://doc.zeroc.com/display/Freeze37/Release+Notes
