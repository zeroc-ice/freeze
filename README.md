[![Build Status](https://travis-ci.org/zeroc-ice/freeze.svg?branch=master)](https://travis-ci.org/zeroc-ice/freeze)
# Freeze

The `Freeze` persistence service allows you to store Ice objects in [Oracle Berkeley DB][1], with all the features you expect from a robust database - transactions, hot backups, indexing, and more.

In C++, `Freeze` and `Berkeley DB` consist of a library that you link with your C++ application. In Java, `Freeze` is a JAR file that you include in your Java application. Together, `Freeze` and `Berkeley DB` give you a fully embedded solution: the databases are regular files on a local file system, there is no database server to setup, and there is no need for ongoing database administration.

`Freeze` lets you choose between two persistence models: evictors and maps. With `Freeze` evictors, `Freeze` persists the state of your Ice objects automatically; these Ice objects just need to define their persistent state in Slice classes. The alternative is to store key-value pairs in Freeze maps, where key and value are both Slice types.

# FreezeScript

`FreezeScript` is a XML-based scripting language that allows you to easily inspect and transform the contents of a `Freeze` database. `FreezeScript`'s `transformdb` is particularly useful for upgrades; with just a few commands, you can transform a database created with a set of Slice definitions to another database that relies on a newer version of these definitions.

# Languages

- [C++](./cpp)
- [Java](./java)

# Copyright and License

Copyright &copy; ZeroC, Inc. All rights reserved.

The default license for Freeze is [GPLv2](http://opensource.org/licenses/GPL-2.0), a popular open-source license with strong [copyleft](http://en.wikipedia.org/wiki/Copyleft) conditions.

If you wish to license Freeze under other terms and conditions, you can purchase a [Commercial License](https://zeroc.com/licensing) from ZeroC. A commercial license for Freeze includes a commercial license for the [Oracle Berkeley DB][1] Transactional Datastore.

# Documentation

- [Freeze Manual](https://doc.zeroc.com/display/Freeze37/Freeze+Manual)

[1]: http://www.oracle.com/us/products/database/berkeley-db/overview/index.htm
