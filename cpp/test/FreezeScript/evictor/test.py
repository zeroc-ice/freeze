# -*- coding: utf-8 -*-
#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

from Util import *

class FreezeScriptEvictorTestCase(ClientTestCase):

    def setupClientSide(self, current):
        current.mkdirs("db")
        current.mkdirs("db_init")
        current.mkdirs("db_check")
        current.mkdirs("db_tmp")

    def runClientSide(self, current):

        dbdir = os.path.join(current.testsuite.getPath(), "db")
        check_dbdir = os.path.join(current.testsuite.getPath(), "db_check")
        tmp_dbdir = os.path.join(current.testsuite.getPath(), "db_tmp")

        current.write("creating test database... ")
        SimpleClient(exe="makedb").run(current)
        current.writeln("ok")

        testold = os.path.join(current.testsuite.getPath(), "TestOld.ice")
        testnew = os.path.join(current.testsuite.getPath(), "TestNew.ice")
        transformxml = os.path.join(current.testsuite.getPath(), "transform.xml")
        checkxml = os.path.join(current.testsuite.getPath(), "check.xml")

        transformdb = TransformDB()

        current.write("executing evictor transformations... ")
        transformdb.run(current, args=["-e", "-p", "--old", testold, "--new", testnew, "-f", transformxml, dbdir,
                        "evictor.db", check_dbdir])
        current.writeln("ok")

        current.write("validating database... ")
        transformdb.run(current, args=["-e", "--old", testnew, "--new", testnew, "-f", checkxml, check_dbdir,
                        "evictor.db", tmp_dbdir])
        current.writeln("ok")

TestSuite(__name__, [FreezeScriptEvictorTestCase()])
