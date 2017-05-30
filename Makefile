.PHONY: all re prepare update clean test dependencies applications dev bash fish git vim tmux atom

OS_BASE := $(if $(OS_BASE),$(OS_BASE),'arch')

all: prepare git vim tmux fish

re: clean all

prepare:
	scripts/prepare.sh

update:
	scripts/update.sh

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

bash:
	bash/install.sh

# TODO: Extract prompt from bash install as standalone
fish: bash
	fish/install.sh

git:
	git/install.sh

vim:
	vim/install.sh

tmux:
	tmux/install.sh

atom:
	ln -s $(PWD)/atom/ $(HOME)/.atom
