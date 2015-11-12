
ByteIntMap.obj: \
	ByteIntMap.cpp \
    "ByteIntMap.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

IntIdentityMap.obj: \
	IntIdentityMap.cpp \
    "IntIdentityMap.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

IntIdentityMapWithIndex.obj: \
	IntIdentityMapWithIndex.cpp \
    "IntIdentityMapWithIndex.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

SortedMap.obj: \
	SortedMap.cpp \
    "SortedMap.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

WstringWstringMap.obj: \
	WstringWstringMap.cpp \
    "WstringWstringMap.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

Client.obj: \
	Client.cpp \
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
    "$(top_srcdir)\test\include\TestCommon.h" \
    "ByteIntMap.h" \
    "IntIdentityMap.h" \
    "IntIdentityMapWithIndex.h" \
    "SortedMap.h" \
    "WstringWstringMap.h" \
