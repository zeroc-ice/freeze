%{

// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#include <NodeI.h>
#include <Parser.h>

#ifdef _MSC_VER
// warning C4102: 'yyoverflowlab' : unreferenced label
#   pragma warning(disable:4102)
// warning C4065: switch statement contains 'default' but no 'case' labels
#   pragma warning(disable:4065)
// warning C4244: '=': conversion from 'int' to 'yytype_int16', possible loss of data
#   pragma warning(disable:4244)
// warning C4702: unreachable code
#   pragma warning(disable:4702)
#endif

using namespace std;
using namespace Ice;

void
yyerror(const char* s)
{
    parser->error(s);
}

%}

%pure_parser
%expect 4

%token TOK_NUMBER

%%

start
: expr
{
    parser->setResult($$);
}
;

expr
: TOK_NUMBER
{
    $$ = $1;
}
| expr '+' expr
{
    $$ = new Complex::AddNodeI($1, $3);
}
| '(' expr ')'
{
    $$ = $2;
}
| expr '*' expr
{
    $$ = new Complex::MultiplyNodeI($1, $3);
}
;

%%
