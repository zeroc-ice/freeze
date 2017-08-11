This example demonstrates the use of the Freeze Transactional Evictor to
implement a reliable gambling operation.

To run the demo, change to the demo directory:

```
cd Freeze\casino
```

On Windows and macOS you need to set your `PATH` and `DYLD_LIBRARY_PATH`
respectively in order for the demos to load the required Berkeley DB C
library. On Linux Berkeley DB C library is typically install in a system
wide directory and you don't need any extra configuration.

On Windows using a 64 bit JVM:

```
set PATH=..\..\packages\berkeley.db.java7.5.3.28.1\build\native\bin\x64;%PATH%
```

If you are using a 32 bit JVM replace `x64` by `Win32` in the command above.

On macOS:

```
set DYLD_LIBRARY_PATH=/usr/local/opt/berkeley-db53/lib;$DYLD_LIBRARY_PATH
```

First start the server:

```
java -jar build/libs/server.jar
```

In another window, start the client:

```
java -jar build/libs/client.jar
```

You can run a number of clients concurrently (in different windows)
to exercise the server even more.

## Highlights:

* The public interface of the server is specified in `Casino.ice`;
  `CasinoStore.ice` is just an implementation detail of the server.

* This demo uses a transactional evictor per servant type; this
  is more efficient than storing different types of servants in
  the same Freeze transactional evictor.

* Transactions often span servants in several evictors; this works
  because all the evictors use the same underlying Berkeley DB
  environment.

* The application code does not deal at all with database deadlocks;
  Freeze retries automatically (and correctly) each time a deadlock is
  detected and reported by Berkeley DB.

* The application code does not perform any synchronization: with
  a Freeze transactional evictor, the servants you get are either
  totally read-only or private to your thread/transaction.

* Destroying a player while this player is participating in a bet
  is an interesting life-cycle situation. What happens if this player
  wins a bet and is destroyed at the same time? Will chips get lost?
  In fact, there is no issue thanks to Berkeley DB locking:
  when a bet picks a winner, it invokes an operation on this object
  (through a proxy) within a transaction. At this point, if the
  object is still alive, it's locked by the transaction, which
  prevents another transaction from acquiring a write lock (for
  example, to destroy it).
