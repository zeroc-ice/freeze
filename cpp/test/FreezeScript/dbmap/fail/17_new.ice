[["suppress-warning:deprecated"]] // for class that implements interface

module Test
{

interface C {};

struct S
{
    C m1; // FAIL
};

};
