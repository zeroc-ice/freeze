# **********************************************************************
#
# Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
#
# **********************************************************************

class FreezeSimpleFileLockTestCase(ClientTestCase):

    def setupClientSide(self, current):
        current.mkdirs("db")

    def runClientSide(self, current):
        current.write("testing Freeze file lock... ")

        client = SimpleClient()

        client.start(current)
        client.expect(current, 'File lock acquired.\.*')

        #
        # Ensure that the file lock exists.
        #
        assert(os.path.exists(os.path.join(current.testsuite.getPath(), "file.lock")))

        clientFail = SimpleClient("ClientFail")
        clientFail.start(current)
        clientFail.expect(current, 'File lock not acquired.')
        clientFail.stop(current, True)

        # send some output to client to terminate it.
        client.sendline(current, 'go')
        client.expect(current, 'File lock released.')
        client.stop(current, True)

        # The lock is gone try to acquire it again.
        client.start(current)
        client.expect(current, 'File lock acquired.\.*')
        client.sendline(current, 'go')
        client.expect(current, 'File lock released.')
        client.stop(current, True)

        current.writeln("ok")

TestSuite(__name__, [FreezeSimpleFileLockTestCase()])
