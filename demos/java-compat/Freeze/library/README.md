This example demonstrates the use of Freeze to manage books in a library.

To run the demo, change to the demo directory:

```
cd Freeze\library
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

In another window, populate the server's database by starting the client and
redirecting its input from the file "books":

```
java -jar build/libs/client.jar < books
```

Then start the client again to use the demo interactively:

```
java -jar build/libs/client.jar
```

Type "help" to get a list of valid commands.

The collocated executable combines the client and server into one program. In
this case you do not need to start a separate server. If you have not already
populated the database, you can do so using the collocated executable as shown
below:

```
java -jar build/libs/collocated.jar < books
```

Then start the interactive demo like this:

```
java -jar build/libs/collocated.jar
```
