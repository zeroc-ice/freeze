# Java Demos

## Overview

This directory contains Java sample programs for Freeze. It includes the
following subdirectories:

- [Freeze](./Freeze) contains Freeze examples for using the Freeze library.

- [Manual](./Manual) contains complete examples for some of the code snippets
in the [Freeze manual][1].

## Build Instructions

### Prerequisites

#### Slice translators

The build system requires the Slice-to-Java and Slice-to-Freeze-Java compilers.

On Linux and macOS, if you have installed Ice or Freeze in a non-standard
location, you'll need to set the `ICE_HOME` or `FREEZE_HOME` environment
variable with the path name of the installation directory. For example:

    $ export ICE_HOME=~/testing/Ice
    $ export FREEZE_HOME=~/testing/Freeze

On Windows, the build system automatically pulls the Ice and Freeze nuget
packages. Unless you want to use nuget packages from a specific location, you
don't need to set the ICE_HOME or FREEZE_HOME environment variables.

#### Freeze JAR files

The Freeze JAR files are not provided with your Freeze installation. You need to
build them from source first.

Please refer to the [Building Freeze for Java](../../java/BuildInstructions.md)
instructions to build these JARs files.

### Building the Demos

The build system for the Java sample programs uses [Gradle](http://gradle.org)
and includes a wrapper script or batch file that automatically downloads Gradle
and all other required components.

To build the demos, open a command window and run:

```
gradlew build
```

## Running the Demos

Refer to the README file in each demo directory for usage instructions.

[1]: https://doc.zeroc.com/display/Freeze37/Freeze+Manual
