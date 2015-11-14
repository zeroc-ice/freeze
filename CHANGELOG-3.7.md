The entries below contain brief descriptions of the changes in a release, in no
particular order. Some of the entries reflect significant new additions, while
others represent minor corrections. Although this list is not a comprehensive
report of every change we made in a release, it does provide details on the
changes we feel Freeze users might need to be aware of.

We recommend that you use the release notes as a guide for migrating your
applications to this release, and the manual for complete details on a
particular aspect of Freeze.

- [Changes in Freeze 3.7.0](#changes-in-freeze-370)
  - [General Changes](#general-changes)
  - [C++ Changes](#c-changes)
  - [Java Changes](#java-changes)

# Changes in Freeze 3.7.0

These are the changes since Freeze 3.6.1:

## General Changes

- Freeze is now a separate component. In prior releases, it was incorporated inside Ice.

## C++ Changes

- The following classes are now provided by Freeze for C++: `IceUtil::AbstractMutex`, `Freeze::Cache`.
  `Freeze::Cache` was previously provided by the `IceUtil` library.

## Java Changes

- The following classes are now provided by Freeze for Java: `Freeze.Cache`, `Freeze.Store`, `Freeze.FileLockException`
  There classes were previously in package `IceUtil` and incorporated in `ice.jar`.


