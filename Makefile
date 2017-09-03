.PHONY: all re clean test dependencies applications dev fish git vim vifm tmux

OS_BASE := $(if $(OS_BASE),$(OS_BASE),'arch')

all: git vim tmux fish vifm

re: clean all

clean:
	scripts/clean.sh

test:
	scripts/test.exp

dependencies:
	os/install.sh dependencies

applications:
	os/install.sh applications

dev:
	scripts/dev.sh $(OS_BASE)

fish:
	fish/install.sh

git:
	git/install.sh

vim:
	vim/install.sh

vifm:
	vifm/install.sh

tmux:
	tmux/install.sh
