# Building Freeze for Java

This page describes how to build and install Freeze for Java from source code. If
you prefer, you can also download [binary distributions][1] for the supported
platforms.

## Build Requirements

### Operating Systems

Freeze for Java is expected to build and run properly on Windows, OS X, and any
recent Linux distribution for x86 and x86_64, and was extensively tested using
the operating systems and compiler versions listed for our [supported
platforms][2]. Due to the portability of Java, it is very likely that it will
also work on other platforms for which a suitable Java implementation is
available.

### Slice to Java Translator

You will need the Slice to Java translator. ZeroC provides translator binaries
for our supported platforms. For other platforms, you will have to either port
Ice for C++ (which contains the Slice to Java translator), or you will have to
translate your Slice files to Java on a supported platform and then copy the
generated Java files to your target platform.

### Java Version

Freeze for Java requires J2SE 1.7.0 or later.

Make sure that the `javac` and `java` commands are present in your PATH.

### Berkeley DB

Freeze uses Berkeley DB as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

ZeroC includes Berkeley DB in the binary distributions for all supported
platforms, or you can build it from source yourself.

In order to run an application that uses Freeze, you must add `db.jar` to your
CLASSPATH and verify that the Berkeley DB shared libraries are in your
`java.library.path`.

Assuming you are using ZeroC's distribution of Berkeley DB, the bash command is
shown below for Linux:

    $ export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH                 (RHEL, SLES, Amazon)
    $ export LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu:$LD_LIBRARY_PATH  (Ubuntu)

On an x86_64 system with a 64-bit JVM, the 64-bit Berkeley DB libraries are
installed in a different directory:

    $ export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH                 (RHEL, SLES, Amazon)
    $ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH  (Ubuntu)

### Gradle

Freeze for Java uses the [Gradle][3] build system, and includes the Gradle wrapper
version 2.8 in the distribution. You cannot build the Freeze for Java source
distribution without an Internet connection. Except for Berkeley DB, Gradle will
download all required packages automatically. These packages are listed below.
Gradle will automatically download any necessary build artifacts from ZeroC's
Maven repository located at

    http://repo.zeroc.com/nexus/content/repositories/thirdparty

## Compiling Freeze for Java

### Preparing to Build

This source distribution cannot be compiled successfully without the Berkeley DB
run time for Java (`db.jar`). The build system searches in standard locations
for the following two JAR files:

    db-5.3.28.jar
    db.jar

If neither of these files is present in the standard locations on your system,
you must set `dbHome` in `gradle.properties`.

The build system also requires the Slice translators from Ice for C++. You must
set the `ICE_HOME` environment variable with the path name of your Ice installation.
For example, on Unix:

    $ export ICE_HOME=/opt/Ice-3.7.0 (For local build)
    $ export ICE_HOME=/usr (For RPM installation)

On Windows:

    > set ICE_HOME=C:\Program Files (x86)\ZeroC\Ice-3.7.0

Before building Freeze for Java, review the settings in the file
`gradle.properties` and edit as necessary.

### Building Freeze for Java

To build Ice, all services, and tests, run

    > gradlew build

Upon completion, the Freeze JAR and POM files are placed in the `lib` subdirectory.

If at any time you wish to discard the current build and start a new one, use
these commands:

    > gradlew clean
    > gradlew build

## Installing Freeze for Java

To install Ice for Java in the directory specified by the `prefix` variable in
`gradle.properties` run the following command

    > gradlew install

The installation installs the following JAR file to `<prefix>/lib`.

    freeze-3.7.0.jar

The POM file are also installed for ease of deployment to a maven-based
distribution system.

## Running the Java Tests

Python is required to run the test suite. To run the tests, open a command
window and change to the top-level directory. At the command prompt, execute:

    > python allTests.py

You can also run tests individually by changing to the test directory and
running this command:

    > python run.py

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

[1]: https://zeroc.com/download.html
[2]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[3]: http://gradle.org
