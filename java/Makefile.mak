# **********************************************************************
#
# Copyright (c) 2003-2015 ZeroC, Inc. All rights reserved.
#
# **********************************************************************

!if "$(GRADLE)" == ""
GRADLE = gradlew.bat
!endif

all:
	$(GRADLE) build

dist:
	$(GRADLE) :Freeze:assemble

clean:
	$(GRADLE) clean

install::
!if "$(PREFIX)" != ""
	$(GRADLE) -Dorg.gradle.project.prefix="$(PREFIX)" install
!else
	$(GRADLE) install
!endif

test:
	@python .\allTests.py
