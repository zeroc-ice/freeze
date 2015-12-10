// **********************************************************************
//
// Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef BOOK_FACTORY_H
#define BOOK_FACTORY_H

#include <LibraryI.h>

class BookFactory : public Ice::ValueFactory
{
public:

    BookFactory(const LibraryIPtr&);

    //
    // Operations from ValueFactory
    //
    virtual Ice::ObjectPtr create(const std::string&);

private:

    LibraryIPtr _library;
};

#endif
