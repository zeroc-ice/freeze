# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

class FreezeFileLockTestCase(ClientTestCase):

    def setupClientSide(self, current):
        self.mkdirs("db")

    def runClientSide(self, current):
        current.write("testing Freeze file lock... ")

        client = SimpleClient()

        client.start(current)
        client.expect('File lock acquired.\.*')

        clientFail = SimpleClient(exe="clientFail" if isinstance(current.testcase.getMapping(), CppMapping) else "ClientFail")
        clientFail.start(current)
        clientFail.expect('File lock not acquired')
        clientFail.stop(current, True)

        # send some output to client to terminate it.
        client.sendline('go')
        client.expect('File lock released.')
        client.stop(current, True)

        # The lock is gone try to acquire it again.
        client.start(current)
        client.expect('File lock acquired.\.*')
        client.sendline('go')
        client.expect('File lock released.')
        client.stop(current, True)

        current.writeln("ok")

TestSuite(__name__, [FreezeFileLockTestCase()])