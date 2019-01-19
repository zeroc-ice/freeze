#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

class FreezeComplexTestCase(ClientTestCase):

    def setupClientSide(self, current):
        current.mkdirs("db")

    def runClientSide(self, current):
        client = SimpleClient(args=["--dbdir", "{testdir}"])
        client.run(current, args=["populate"])
        client.run(current, args=["validate"])

TestSuite(__name__, [FreezeComplexTestCase()])
