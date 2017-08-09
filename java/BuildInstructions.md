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

### Slice to Java and Slice to Freeze Java Compilers

You will need the slice2java and slice2freezej compilers, which are implemented
in C++. These compilers are included in the Ice and Freeze binary distributions.

### Java Version

Freeze for Java requires J2SE 1.7.0 or later.

Make sure that the `javac` and `java` commands are present in your PATH.

### Berkeley DB

Freeze uses Berkeley DB as its underlying database and currently requires
Berkeley DB version 5.3 (the recommended version is 5.3.28).

Berkeley DB for Java is not a pure Java implementation: the `db.jar`
implementation calls a Berkeley DB C library through JNI.

In order to run an application that uses Freeze, you must add `db.jar` to your
CLASSPATH and verify that the Berkeley DB shared library is in your
`java.library.path`.

### Gradle

Freeze for Java uses the [Gradle][2] build system, and includes the Gradle
wrapper version 4.0.1 in the distribution. You cannot build the Freeze for Java
source distribution without an Internet connection. Except for Berkeley DB,
Gradle will download all required packages automatically (on Windows, it also
downloads the `berkeley.db.java7` NuGet automatically).

## Compiling Freeze for Java on Linux or macOS

You need to install Berkeley DB Java before building Freeze for Java. The build 
system searches in standard locations for the following JAR files:
```
db-5.3.28.jar
db-5.3.21.jar
db.jar
```

You can build Freeze for Java using the Slice to Java and the Slice to
Freeze Java compilers installed in `/usr/bin` (Linux) or `/usr/local/bin` 
(macOS) with the following commands:
```
export ICE_BIN_DIST=all
export FREEZE_BIN_DIST=all
./gradlew build
```

If you installed Slice to Java (Ice) or Slice to Freeze Java (Freeze C++)
in another directory, you need to first set `ICE_HOME` or `FREEZE_HOME`, for
example:
```
export ICE_HOME=/opt/ice-3.7.0
export FREEZE_HOME=/opt/freeze-3.7.0
```

If you leave `ICE_BIN_DIST` resp. `FREEZE_BIN_DIST` unset, you must build
`slice2java` in the `freeze/ice` submodule resp. `slice2freezej` in the 
`freeze/cpp` directory.

## Compiling Freeze for Java on Windows

You can build Freeze for Java using NuGet packages that the build system
downloads automatically from nuget.org:
```
set ICE_BIN_DIST=all
set FREEZE_BIN_DIST=all
gradlew build
```

This will download and use a binary NuGet package for Ice that includes the 
Slice to Java compiler. If you want to use another Ice installation, set 
`ICE_HOME`, for example:
```
set ICE_HOME=C:\Program Files\ZeroC\Ice-3.7.0
```

If you leave `ICE_BIN_DIST` resp. `FREEZE_BIN_DIST` unset, you must build
`slice2java` in the `freeze/ice` submodule resp. `slice2freezej` in the 
`freeze/cpp` directory.

## Cleaning and Rebuilding Freeze for Java

If at any time you wish to discard the current build and start a new one, use
these commands:
```
gradlew clean
gradlew build
```

## Running the Java Tests

The test suite requires Python and files in the the ice submodule;
if `freeze/ice` is an empty directory, fetch this `ice` submodule with:
```
git submodule update --init
```

To run the tests, open a command window and change to the top-level 
directory. At the command prompt, execute:
```
python allTests.py
```

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

[1]: https://doc.zeroc.com/display/Freeze37/Supported+Platforms+for+Freeze+3.7.0
[2]: http://gradle.org
