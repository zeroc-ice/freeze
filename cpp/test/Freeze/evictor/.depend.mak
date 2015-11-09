
Test.h: \
    Test.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Identity.ice

Test.obj: \
	Test.cpp \
    "Test.h" \

Client.obj: \
	Client.cpp \
    "C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\freeze\ice\cpp\test\include\TestCommon.h" \
    "Test.h" \

TestI.obj: \
	TestI.cpp \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "TestI.h" \
    "Test.h" \
    "C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\freeze\ice\cpp\test\include\TestCommon.h" \

Server.obj: \
	Server.cpp \
    "TestI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "Test.h" \
