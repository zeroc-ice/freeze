
AssignVisitor.obj: \
	AssignVisitor.cpp \
    "AssignVisitor.h" \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

Data.obj: \
	Data.cpp \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "Exception.h" \

Error.obj: \
	Error.cpp \
    "Error.h" \
    "Exception.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

Functions.obj: \
	Functions.cpp \
    "Functions.h" \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

Exception.obj: \
	Exception.cpp \
    "Exception.h" \

Parser.obj: \
	Parser.cpp \
    "Parser.h" \
    "Data.h" \
    "Error.h" \
    "GrammarUtil.h" \

Print.obj: \
	Print.cpp \
    "Print.h" \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

Util.obj: \
	Util.cpp \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "Exception.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \

Grammar.obj: \
	Grammar.cpp \
    "GrammarUtil.h" \
    "Parser.h" \
    "Data.h" \
    "Error.h" \

Scanner.obj: \
	Scanner.cpp \
    "GrammarUtil.h" \
    "Parser.h" \
    "Data.h" \
    "Error.h" \
    "Grammar.h" \

TransformAnalyzer.obj: \
	TransformAnalyzer.cpp \
    "TransformAnalyzer.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

TransformVisitor.obj: \
	TransformVisitor.cpp \
    "TransformVisitor.h" \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

Transformer.obj: \
	Transformer.cpp \
    "Transformer.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "Data.h" \
    "Error.h" \
    "Parser.h" \
    "TransformVisitor.h" \
    "AssignVisitor.h" \
    "Print.h" \
    "Functions.h" \
    "Exception.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Exception.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \

transformdb.obj: \
	transformdb.cpp \
    "Transformer.h" \
    "$(includedir)\Freeze\Connection.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "Data.h" \
    "Error.h" \
    "TransformAnalyzer.h" \
    "Exception.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Catalog.h" \
    "$(includedir)\Freeze\Exception.h" \

DumpDescriptors.obj: \
	DumpDescriptors.cpp \
    "DumpDescriptors.h" \
    "Parser.h" \
    "Data.h" \
    "Error.h" \
    "AssignVisitor.h" \
    "Print.h" \
    "Functions.h" \
    "Exception.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \

DumpDB.obj: \
	DumpDB.cpp \
    "DumpDescriptors.h" \
    "Parser.h" \
    "Data.h" \
    "Error.h" \
    "Util.h" \
    "$(includedir)\Freeze\CatalogData.h" \
    "Exception.h" \
    "$(includedir)\Freeze\EvictorF.h" \
    "$(includedir)\Freeze\ConnectionF.h" \
    "$(includedir)\Freeze\DB.h" \
    "$(includedir)\Freeze\Transaction.h" \
    "$(includedir)\Freeze\Connection.h" \
