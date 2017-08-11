This demo is a simple benchmark to measure the performance of Freeze for various
data types.

To run the demo, change to the demo directory:

```
cd Freeze\bench
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
set DYLD_LIBRARY_PATH=/usr/local/opt/berkeley-db53/lib
```

start the client:

```
java -jar build/libs/client.jar
```
