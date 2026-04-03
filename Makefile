# SPDX-License-Identifier: GPL-3.0-or-later

export objtree := build
export lualatex ?= lualatex
export onchange ?= onchange

notes-dir := $(addsuffix /,$(shell LC_ALL=C find * -type d -name '[! -~]*'))
notes := $(addprefix $(objtree)/,$(notes-dir:/=.pdf))
notes-hot-build := $(addprefix hot-build,$(notes-dir))

$(notes):

.PHONY: $(notes-dir)

$(notes-dir):
	$(MAKE) -f $(@)/Makefile

$(objtree)/%.pdf: %/
	mkdir -p $(@D)
	cp $*/$(objtree)/note.pdf $@


.PHONY: $(notes-hot-build)

%/hot-build:
	$(MAKE) -f $*/Makefile hot-build
