
TestOld.h: \
    TestOld.ice

TestOld.obj: \
	TestOld.cpp \
    "TestOld.h" \

IntSMap.obj: \
	IntSMap.cpp \
    "IntSMap.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "TestOld.h" \

makedb.obj: \
	makedb.cpp \
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
    "IntSMap.h" \
    "TestOld.h" \
