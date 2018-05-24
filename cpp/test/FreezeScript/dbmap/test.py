# -*- coding: utf-8 -*-
# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

from Util import *

class FreezeScriptDBMapTestCase(ClientTestCase):

    def setupClientSide(self, current):
        current.mkdirs("db")
        current.mkdirs("db_init")
        current.mkdirs("db_check")
        current.mkdirs("db_tmp")

    def runClientSide(self, current):

        transformdb = TransformDB()

        dbdir = os.path.join(current.testcase.getPath(), "db")
        init_dbdir = os.path.join(current.testcase.getPath(), "db_init")
        check_dbdir = os.path.join(current.testcase.getPath(), "db_check")
        tmp_dbdir = os.path.join(current.testcase.getPath(), "db_tmp")

        regex1 = re.compile(r"_old\.ice$", re.IGNORECASE)
        files = []
        for file in os.listdir(os.path.join(current.testcase.getPath(), "fail")):
            if(regex1.search(file)):
                files.append(file)

        regex2 = re.compile(r"^.*transf(ormdb|~1)(\.exe)?", re.IGNORECASE)

        current.write("testing error detection... ")

        files.sort()
        for oldfile in files:

            newfile = oldfile.replace("old", "new")

            if oldfile.find("19") == 0:
                value = "::Test::C"
            else:
                value = "int"

            # command = '"' + transformdb +
            #           '" --old "' + os.path.join(current.testcase.getPath(), "fail", oldfile) +
            #           '" --new "' + os.path.join(current.testcase.getPath(), "fail", newfile) +
            #           '" -o tmp.xml --key string --value ' + value

            transformdb.run(current, args=["--old", "{testdir}/fail/" + oldfile, "--new", "{testdir}/fail/" + newfile,
                           "-o", "tmp.xml", "--key", "string", "--value", value], exitstatus=1)

            lines1 = transformdb.getOutput(current).strip().split("\n")
            lines2 = open(os.path.join(current.testcase.getPath(), "fail", oldfile.replace("_old.ice", ".err")), "r").readlines()
            if len(lines1) != len(lines2):
                raise RuntimeError("failed! (1)")

            i = 0
            while i < len(lines1):
                line1 = regex2.sub("", lines1[i]).strip()
                line2 = regex2.sub("", lines2[i]).strip()
                if line1 != line2:
                    print("line1 = " + line1)
                    print("line2 = " + line2)
                    raise RuntimeError("failed! (2)")
                i = i + 1

        current.writeln("ok")

        current.write("creating test database... ")
        SimpleClient(exe="makedb").run(current)
        current.writeln("ok")

        testold = os.path.join(current.testcase.getPath(), "TestOld.ice")
        testnew = os.path.join(current.testcase.getPath(), "TestNew.ice")
        initxml = os.path.join(current.testcase.getPath(), "init.xml")
        checkxml = os.path.join(current.testcase.getPath(), "check.xml")

        current.write("initializing test database... ")
        transformdb.run(current,
                        args=["--old", testold, "--new", testold, "-f", initxml, dbdir, "default.db", init_dbdir])
        current.writeln("ok")

        current.write("executing default transformations... ")
        transformdb.run(current,
                        args=["--old", testold, "--new", testnew, "--key", "int", "--value", "::Test::S", init_dbdir,
                        "default.db", check_dbdir])
        current.writeln("ok")

        current.write("validating database... ")
        transformdb.run(current,
                        args=["--old", testnew, "--new", testnew, "-f", checkxml, check_dbdir, "default.db", tmp_dbdir])
        current.writeln("ok")

TestSuite(__name__, [FreezeScriptDBMapTestCase()])
