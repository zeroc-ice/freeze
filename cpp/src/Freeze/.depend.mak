
BackgroundSaveEvictor.h: \
    "$(slicedir)\Freeze\BackgroundSaveEvictor.ice" \
    "$(slicedir)/Freeze/Evictor.ice" \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ObjectAdapterF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ServantLocator.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Current.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ConnectionF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Identity.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Version.ice \
    "$(slicedir)/Freeze/Exception.ice"

CatalogData.h: \
    "$(slicedir)\Freeze\CatalogData.ice"

Connection.h: \
    "$(slicedir)\Freeze\Connection.ice" \
    "$(slicedir)/Freeze/Transaction.ice" \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Version.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/CommunicatorF.ice

ConnectionF.h: \
    "$(slicedir)\Freeze\ConnectionF.ice"

DB.h: \
    "$(slicedir)\Freeze\DB.ice"

Evictor.h: \
    "$(slicedir)\Freeze\Evictor.ice" \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ObjectAdapterF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ServantLocator.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Current.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ConnectionF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Identity.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Version.ice \
    "$(slicedir)/Freeze/Exception.ice"

EvictorF.h: \
    "$(slicedir)\Freeze\EvictorF.ice"

EvictorStorage.h: \
    "$(slicedir)\Freeze\EvictorStorage.ice" \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Identity.ice

Exception.h: \
    "$(slicedir)\Freeze\Exception.ice"

Transaction.h: \
    "$(slicedir)\Freeze\Transaction.ice"

TransactionalEvictor.h: \
    "$(slicedir)\Freeze\TransactionalEvictor.ice" \
    "$(slicedir)/Freeze/Evictor.ice" \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ObjectAdapterF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ServantLocator.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Current.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/ConnectionF.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Identity.ice \
    C:\Users\Dwayne\.babun\cygwin\home\Dwayne\src\ice\slice/Ice/Version.ice \
    "$(slicedir)/Freeze/Exception.ice"

PingObject.h: \
    PingObject.ice

BackgroundSaveEvictorI.obj: \
	BackgroundSaveEvictorI.cpp \
    "BackgroundSaveEvictorI.h" \
    "EvictorI.h" \
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
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "Util.h" \

Catalog.obj: \
	Catalog.cpp \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\CatalogData.h" \

CatalogIndexList.obj: \
	CatalogIndexList.cpp \
    "$(includedir)\Freeze\CatalogIndexList.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

ConnectionI.obj: \
	ConnectionI.cpp \
    "ConnectionI.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "TransactionI.h" \
    "SharedDbEnv.h" \
    "$(includedir)\Freeze\Exception.h" \
    "MapI.h" \

EvictorI.obj: \
	EvictorI.cpp \
    "EvictorI.h" \
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
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "Util.h" \
    "PingObject.h" \

EvictorIteratorI.obj: \
	EvictorIteratorI.cpp \
    "EvictorIteratorI.h" \
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
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorI.h" \
    "SharedDbEnv.h" \
    "Util.h" \

Index.obj: \
	Index.cpp \
    "$(includedir)\Freeze\DB.h" \
    "IndexI.h" \
    "EvictorI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \

IndexI.obj: \
	IndexI.cpp \
    "IndexI.h" \
    "$(includedir)\Freeze\DB.h" \
    "EvictorI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "Util.h" \

MapDb.obj: \
	MapDb.cpp \
    "MapDb.h" \
    "ConnectionI.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "TransactionI.h" \
    "SharedDbEnv.h" \
    "$(includedir)\Freeze\Exception.h" \
    "Util.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\CatalogIndexList.h" \

MapI.obj: \
	MapI.cpp \
    "MapI.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "ConnectionI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "TransactionI.h" \
    "SharedDbEnv.h" \
    "MapDb.h" \
    "Util.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\CatalogIndexList.h" \

ObjectStore.obj: \
	ObjectStore.cpp \
    "ObjectStore.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "EvictorI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "BackgroundSaveEvictorI.h" \
    "Util.h" \
    "IndexI.h" \

SharedDbEnv.obj: \
	SharedDbEnv.cpp \
    "SharedDbEnv.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "Util.h" \
    "MapDb.h" \
    "ConnectionI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "TransactionI.h" \
    "TransactionalEvictorContext.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "EvictorI.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "ObjectStore.h" \
    "EvictorIteratorI.h" \
    "$(includedir)\Freeze\CatalogIndexList.h" \

TransactionalEvictorContext.obj: \
	TransactionalEvictorContext.cpp \
    "TransactionalEvictorContext.h" \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "EvictorI.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "ObjectStore.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "TransactionalEvictorI.h" \
    "Util.h" \
    "ConnectionI.h" \

TransactionalEvictorI.obj: \
	TransactionalEvictorI.cpp \
    "TransactionalEvictorI.h" \
    "EvictorI.h" \
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
    "ObjectStore.h" \
    "$(includedir)\Freeze\EvictorStorage.h" \
    "TransactionI.h" \
    "EvictorIteratorI.h" \
    "SharedDbEnv.h" \
    "Util.h" \
    "TransactionalEvictorContext.h" \

TransactionHolder.obj: \
	TransactionHolder.cpp \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

TransactionI.obj: \
	TransactionI.cpp \
    "TransactionI.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "ConnectionI.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "SharedDbEnv.h" \
    "$(includedir)\Freeze\Exception.h" \

Util.obj: \
	Util.cpp \
    "Util.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \

BackgroundSaveEvictor.obj: \
	BackgroundSaveEvictor.cpp \
    "$(includedir)\Freeze\BackgroundSaveEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \

CatalogData.obj: \
	CatalogData.cpp \
    "$(includedir)\Freeze\CatalogData.h" \

Connection.obj: \
	Connection.cpp \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \

ConnectionF.obj: \
	ConnectionF.cpp \
    "$(includedir)\Freeze\ConnectionF.h" \

DB.obj: \
	DB.cpp \
    "$(includedir)\Freeze\DB.h" \

Evictor.obj: \
	Evictor.cpp \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \

EvictorF.obj: \
	EvictorF.cpp \
    "$(includedir)\Freeze\EvictorF.h" \

EvictorStorage.obj: \
	EvictorStorage.cpp \
    "$(includedir)\Freeze\EvictorStorage.h" \

Exception.obj: \
	Exception.cpp \
    "$(includedir)\Freeze\Exception.h" \

Transaction.obj: \
	Transaction.cpp \
    "$(includedir)\Freeze\Transaction.h" \

TransactionalEvictor.obj: \
	TransactionalEvictor.cpp \
    "$(includedir)\Freeze\TransactionalEvictor.h" \
    "$(includedir)\Freeze\Evictor.h" \
    "$(includedir)\Freeze\Exception.h" \

PingObject.obj: \
	PingObject.cpp \
    "PingObject.h" \
