#!/usr/bin/env python
#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

import os, sys
sys.path.append(os.path.join(os.path.dirname(__file__), "scripts"))
sys.path.append(os.path.join(os.path.dirname(__file__), "ice", "scripts"))

from Util import runTests, Mapping

runTests(mappings=[Mapping.getByName("cpp"), Mapping.getByName("java")])
