//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

class ContactFactory implements Ice.ValueFactory
{
    @Override
    public Ice.Object
    create(String type)
    {
        assert(type.equals("::Demo::Contact"));
        return new ContactI(this);
    }

    void
    setEvictor(Freeze.Evictor evictor)
    {
        _evictor = evictor;
    }

    Freeze.Evictor
    getEvictor()
    {
        return _evictor;
    }

    private Freeze.Evictor _evictor;
}
