# **********************************************************************
#
# Copyright (c) 2003-2017 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

class FreezeEvictorTestCase(ClientServerTestCase):

    def setupClientSide(self, current):
        current.mkdirs("db")
        current.createFile("db/DB_CONFIG", lines=["set_flags DB_TXN_NOSYNC"])

props = {
    'Freeze.DbEnv.db.DbHome' : '{testdir}/db',
    'Ice.Config' : '{testdir}/config'
}

TestSuite(__name__, [FreezeEvictorTestCase(client=Client(props=props), server=Server(props=props))])
