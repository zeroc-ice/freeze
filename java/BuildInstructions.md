# Building Freeze for Java

This page describes how to build and install Freeze for Java from source code.

## Build Requirements

### Operating Systems

Freeze for Java is expected to build and run properly on Windows, macOS, and any
recent Linux distribution for x86 and x86_64, and was extensively tested using
the operating systems and compiler versions listed for our [supported
platforms][1]. Due to the portability of Java, it is very likely that it will
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

Freeze for Java uses the [Gradle][2] build system, and includes the Gradle
wrapper version 4.0.1 in the distribution. You cannot build the Freeze for Java
source distribution without an Internet connection. Except for Berkeley DB,
Gradle will download all required packages automatically. These packages are
listed below. Gradle will automatically download any necessary build artifacts.

## Compiling Freeze for Java

### Preparing to Build

This source distribution cannot be compiled successfully without the Berkeley DB
run time for Java (`db.jar`). The build system searches in standard locations
for the following two JAR files:

    db-5.3.28.jar
    db-5.3.21.jar
    db.jar

The build system requires the Slice to Java compiler. You can build the ice
submodule or use a binary package.

For example, on Unix:

```
export ICE_BIN_DIST=all
```

If Ice was installed in a non standard location you also need to set
`ICE_HOME`:

```
export ICE_HOME=/opt/Ice-3.7.0
```

On Windows:

```
set ICE_BIN_DIST=all
```

This will download the binary NuGet packages for Ice that include the Slice to
Java compiler, if you want to use an existing Ice installation you must also
set `ICE_HOME`

```
set ICE_HOME=C:\Program Files\ZeroC\Ice-3.7.0
```

Finally you also need the Slice to Freeze Java compiler, you can build it from
the `cpp` directory or use a binary package:

For example on Unix:

```
export FREEZE_BIN_DIST=all
```

If Freeze was installed in a non standard location you also need to set
`FREEZE_HOME`:

```
export ICE_HOME=/opt/Ice-3.7.0
```

On Windows:

```
set FREEZE_BIN_DIST=all
```

This will download the binary NuGet packages for Freeze that include the Slice
to Freeze Java compiler, if you want to use an existing Freeze installation you
must also set `FREEZE_HOME`

```
set FREEZE_HOME=zeroc.freeze.v140.3.7.0.0
```

Before building Freeze for Java, review the settings in the file
`gradle.properties` and edit as necessary.

### Building Freeze for Java

To build Ice, all services, and tests, run

```
gradlew build
```

Upon completion, the Freeze JAR and POM files are placed in the `lib`
subdirectory.

If at any time you wish to discard the current build and start a new one, use
these commands:

```
gradlew clean
gradlew build
```

## Running the Java Tests

Python is required to run the test suite. To run the tests, open a command
window and change to the top-level directory. At the command prompt, execute:

```
python allTests.py
```

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://gradle.org
