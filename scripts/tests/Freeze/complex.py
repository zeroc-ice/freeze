# **********************************************************************
#
# Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

class FreezeComplexTestCase(ClientTestCase):

    def setupClientSide(self, current):
        self.mkdirs("db")

    def runClientSide(self, current):
        client = SimpleClient(args=["--dbdir", "{testdir}"])
        client.run(current, args=["populate"])
        client.run(current, args=["validate"])

TestSuite(__name__, [FreezeComplexTestCase()])