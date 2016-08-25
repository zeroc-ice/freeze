module Test
{

interface C {};

struct S
{
    C m1; // FAIL
};

};
