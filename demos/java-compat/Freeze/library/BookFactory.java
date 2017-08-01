// **********************************************************************
//
// Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

class BookFactory implements Ice.ValueFactory
{
    @Override
    public Ice.Object
    create(String type)
    {
        assert(type.equals("::Demo::Book"));
        return new BookI(_library);
    }

    BookFactory(LibraryI library)
    {
        _library = library;
    }

    private LibraryI _library;
}
