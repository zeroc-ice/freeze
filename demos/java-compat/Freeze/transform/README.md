This demo shows how to transform a Freeze map when its definition changes.

In this demo, we start with a simple "contacts" map:
```
key = string
value = struct ContactData
    {
        string phoneNumber;
    }
```

Later on, we want to add a new data member to ContactData:

```
//
// New version of ContactData defined in NewContactData.ice
//
struct NewContactData
{
    string phoneNumber;
    string emailAddress;
}
```

If the contacts map was not sorted on its key, the transformation
would be a straightforward 'FreezeScript' transformation:
```
transformdb --old ContactData.ice --new NewContactData.ice -f transform.xml db dbnew
```

With a sorted map, the situation is more complicated. transformdb is unaware of
the sort order, and as a result transforms the map into an unsorted map -- or
more precisely, a new map sorted using Berkeley DB's default sort order
(comparison of binary strings that correspond to data encoded using the Ice
encoding).

The solution, illustrated in this demo, is to recreate the map after the
successful transformdb transformation.

This demo provides four programs:

 * Create

   Creates or updates the contacts map in the `db` directory (uses the old
   version of ContactData)

 * Read

   Reads and displays the contents of the contacts map in the `db` directory
   (uses the old version of ContactData)

 * ReadNew

   Reads and displays the contents of the contacts map in the `dbnew` directory
   (uses the new version of ContactData)

 * Recreate

   Recreate the contacts map in the 'dbnew' directory (uses the new version of
   ContactData)

## Running the demo

* First change to the demo directory:
  ```
  cd Freeze\transform
  ```

 * Create the original map, by running Create:
   ```
   java -jar build/libs/create.jar
   ```

 * Display the entries created by create:
   ```
   java -jar build/libs/read.jar

   ```

   Please notice the alphabetical sort order.

 * transform the contacts database to the new format:

   Ensure that transformdb executable and its dependencies are included in your
   `PATH`

   on Linux and macOS:
   ```
   export PATH=$FREEZE_HOME/bin;$PATH
   ```

   on Windows:
   ```
   set PATH=..\..\packages\zeroc.freeze.v140.3.7.10\build\native\bin\x64\Release;%PATH%
   ```

   And then run the transformdb command as:
   ```
   transformdb --old ContactData.ice --new NewContactData.ice -f transform.xml db dbnew
   ```

 * read the transformed contacts map:
   ```
   java -jar build/libs/readnew.jar
   ```

   You'll notice the sort order (looks random), and the corrupt index. The index
   is actually created by ReadNew when it opens contacts; the mismatch between
   the expected sort order (alphabetical) and actual sort order leads to this
   corruption.

   If you prefer, you can update ReadNew with
   ```
   boolean createDb = false
   ```

   With this update, `ReadNew` does not create the index and will fail to open
   the contacts map when the associated phoneNumber index does not exist.

 * recreate the new contacts map with:
   ```
   java -jar build/libs/recreate.jar

   ```

   Recreate reads and rewrites the contacts map with the proper sort order; it
   also removes and recreates the phoneNumber index. You can run 'java Recreate
   `--Freeze.Trace.Map=2` to get more information on the actions performed by
   Recreate.

 * read again the new contacts map:
   ```
   java -jar build/libs/readnew.jar
   ```

   This time, the sort order should be alphabetical again, and ReadNew is
   expected to complete successfully.
