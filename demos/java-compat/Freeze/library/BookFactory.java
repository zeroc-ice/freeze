//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

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
