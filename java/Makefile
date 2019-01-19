#
# Copyright (c) ZeroC, Inc. All rights reserved.
#

ifneq ($(prefix),)
INSTALL_FLAGS += -Dorg.gradle.project.prefix=$(prefix)
endif

ifneq ($(DESTDIR),)
INSTALL_FLAGS += -Dorg.gradle.project.DESTDIR=$(DESTDIR)
endif

ifeq ($(GRADLE),)
GRADLE = ./gradlew
endif

all:
	$(GRADLE) $(BUILD_FLAGS) build

dist:
	$(GRADLE) $(BUILD_FLAGS) :Freeze:assemble

clean:
	$(GRADLE) clean

install::
	$(GRADLE) $(INSTALL_FLAGS) install

test::
	@python ./allTests.py
