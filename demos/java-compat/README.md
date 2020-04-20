# Java Demos

## Overview

This directory contains Java sample programs for Freeze. It includes the
following subdirectories:

- [Freeze](./Freeze) contains Freeze examples for using the Freeze library.

- [Manual](./Manual) contains complete examples for some of the code snippets
in the [Freeze Manual][1].

## Build Instructions

### Prerequisites

#### Slice Compilers

The build system requires the Slice-to-Java and Slice-to-Freeze-Java compilers.

On Linux and macOS, if you have installed Ice or Freeze in a non-standard
location, you'll need to set the `ICE_HOME` or `FREEZE_HOME` environment
variable with the path name of the installation directory. For example:

```
export ICE_HOME=/opt/Ice-3.7.4
export FREEZE_HOME=/opt/Freeze-3.7.4
```

On Windows, the build system automatically pulls the Ice and Freeze NuGet
packages. Unless you want to use NuGet packages from a specific location, you
don't need to set the ICE_HOME or FREEZE_HOME environment variables.

#### Freeze JAR files

The Freeze JAR files are not provided with your Freeze installation. You need to
build them from source first.

Please refer to the [Building Freeze for Java](../../java/BuildInstructions.md)
instructions to build these JARs files.

### Building the Demos

The build system for the Java sample programs uses [Gradle](https://gradle.org)
and includes a wrapper script or batch file that automatically downloads Gradle
and all other required components.

To build the demos, open a command window and run:

```
gradlew build
```

## Running the Demos

Refer to the README file in each demo directory for usage instructions.

You also need to make sure your Java library path contains the
Berkeley DB C library used by `db.jar`.

On Windows, the build system automatically installs the `berkeley.db.java7`
NuGet package from nuget.org, and you want to add its `bin` directory to
your PATH, for example:
```
set PATH=%USERPROFILE%\freeze\demos\java-compat\packages\berkeley.db.java7.5.3.28.1\build\native\bin\x64;%PATH%
```

Replace `x64` by `Win32` if you are using a 32-bit JVM.

On macOS, if you use the `berkeley-db@5.3` formula (as we recommend), you
should set `java.library.path` explicitely each time you start a Freeze-based
application, for example:
```
java -Djava.library.path=/usr/local/opt/berkeley-db@5.3/lib -jar build/libs/server.jar
```

[1]: https://doc.zeroc.com/freeze/3.7/freeze-manual
