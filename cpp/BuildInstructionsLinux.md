# Building Freeze for C++ on Linux

This file describes the Freeze source distribution, including information about
compiler requirements, third-party dependencies, and instructions for building
and testing the distribution.

## C++ Build Requirements

### Operating Systems and Compilers

Freeze is expected to build and run properly on any recent Linux distribution for
x86 and x86_64, and was extensively tested using the operating systems and
compiler versions listed for our [supported platforms][1].

### Third-Party Libraries

Freeze uses [Berkeley DB][2] as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

ZeroC supplies binary packages for Berkeley DB on supported Linux
distributions that do not include them:

- RHEL 6, SLES12, SLES 11 and Amzn 2015.03

## Building Freeze

In a command window, change to the `cpp` subdirectory:

    $ cd cpp

Edit `config/Make.rules` to establish your build configuration. The comments in
the file provide more information.

If you've installed Ice in a non-standard location, you'll need to set the
`ICE_HOME` environment variable with the path name of the installation directory:
```
export ICE_HOME=~/testing/Ice
```

Now you're ready to build Freeze:

    $ make

This will build the FreezeScript utilities, Freeze library, tests, and demos.

### 32-bit Source Builds on Linux x86_64

By default, builds on x86_64 are 64-bit. To perform a 32-bit build on an x86_64
Linux system, set the environment variable `LP64` to no, as shown below:

    $ export LP64=no

## Installing a C++ Source Build

Simply run `make install`. This will install Freeze in the directory specified by
the `prefix` variable in `config/Make.rules`.

After installation, make sure that the `prefix/bin` directory is in your `PATH`.

If you choose to not embed a `runpath` into executables at build time (see your
build settings in `config/Make.rules`) or did not create a symbolic link from
the `runpath` directory to the installation directory, you also need to add the
library directory to your `LD_LIBRARY_PATH`.

On an x86 system, the library directory is:

    prefix/lib                   (RHEL, SLES, Amazon)
    prefix/lib/i386-linux-gnu    (Ubuntu)

On an x86_64 system:

    prefix/lib64                 (RHEL, SLES, Amazon)
    prefix/lib/x86_64-linux-gnu  (Ubuntu)

When compiling Freeze programs, you must pass the location of the `prefix/include`
directory to the compiler with the `-I` option, and the location of the library
directory with the `-L` option. If building a C++11 program, you must add the
`/c++11` suffix to the library directory (such as `prefix/lib/c++11`).

## Running the Test Suite

Python is required to run the test suite.

After a successful source build, you can run the tests as follows:

    $ make test

This command is equivalent to:

    $ python allTests.py

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

## Running the Demos

Before running a demo, make sure you've configured your environment to use Ice
as described in the [release notes][3].

Refer to the README file in each demo directory for usage instructions.

[1]: https://doc.zeroc.com/display/Ice37/Supported+Platforms+for+Ice+3.7.0
[2]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
[3]: https://doc.zeroc.com/display/Ice37/Ice+Release+Notes
