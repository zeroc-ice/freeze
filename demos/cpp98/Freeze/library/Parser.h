//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#ifndef PARSER_H
#define PARSER_H

#include <Ice/Ice.h>
#include <Library.h>
#include <list>
#include <stdio.h>

//
// Stuff for flex and bison
//

#define YYSTYPE std::list<std::string>
#define YY_DECL int yylex(YYSTYPE* yylvalp)
YY_DECL;
int yyparse();

//
// I must set the initial stack depth to the maximum stack depth to
// disable bison stack resizing. The bison stack resizing routines use
// simple malloc/alloc/memcpy calls, which do not work for the
// YYSTYPE, since YYSTYPE is a C++ type, with constructor, destructor,
// assignment operator, etc.
//
#define YYMAXDEPTH  10000 // 10000 should suffice. Bison default is 10000 as maximum.
#define YYINITDEPTH YYMAXDEPTH // Initial depth is set to max depth, for the reasons described above.

//
// Newer bison versions allow to disable stack resizing by defining
// yyoverflow.
//
#define yyoverflow(a, b, c, d, e, f) yyerror(a)

class Parser;
typedef IceUtil::Handle<Parser> ParserPtr;

class Parser : public IceUtil::SimpleShared
{
public:

    Parser(const Demo::LibraryPrx&);

    void usage();

    void addBook(const std::list<std::string>&);
    void findIsbn(const std::list<std::string>&);
    void findAuthors(const std::list<std::string>&);
    void nextFoundBook();
    void printCurrent();
    void rentCurrent(const std::list<std::string>&);
    void returnCurrent();
    void removeCurrent();
    void setEvictorSize(const std::list<std::string>&);
    void shutdown();

    //
    // With older flex version <= 2.5.35 YY_INPUT second
    // paramenter is of type int&, in newer versions it
    // changes to size_t&
    //
    void getInput(char*, int&, size_t);
    void getInput(char*, size_t&, size_t);
    void continueLine();
    const char* getPrompt();

    void error(const char*);
    void error(const std::string&);

    void warning(const char*);
    void warning(const std::string&);

    int parse(bool = false);

private:

    Parser& operator=(const Parser&);

    Demo::BookPrxSeq _foundBooks;
    Demo::BookPrxSeq::iterator _current;

    const Demo::LibraryPrx _library;
    bool _continue;
    int _errors;
};

extern Parser* parser; // The current parser for bison/flex

#endif
