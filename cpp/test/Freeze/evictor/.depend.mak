
Test.h: \
    Test.ice \
    c:\Users\bernard\builds\ice\slice/Ice/Identity.ice

Test.obj: \
	Test.cpp \
    "Test.h" \

Client.obj: \
	Client.cpp \
    "$(top_srcdir)\test\include\TestCommon.h" \
    "Test.h" \

TestI.obj: \
	TestI.cpp \
    "$(includedir)\Freeze\Freeze.h" \
    "$(includedir)\Freeze\Initialize.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\Index.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Map.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\TransactionHolder.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\AbstractMutex.h" \
    "$(includedir)\Freeze\Cache.h" \
    "TestI.h" \
    "Test.h" \
    "$(top_srcdir)\test\include\TestCommon.h" \

Server.obj: \
	Server.cpp \
    "TestI.h" \
    "$(includedir)\Freeze\Freeze.h" \
    "$(includedir)\Freeze\Initialize.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\Index.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Map.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\TransactionHolder.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\AbstractMutex.h" \
    "$(includedir)\Freeze\Cache.h" \
    "Test.h" \
