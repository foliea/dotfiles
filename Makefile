.PHONY: all re prepare update clean test dependencies applications dev bash git vim

OS_BASE := $(if $(OS_BASE),$(OS_BASE),'arch')

all: prepare bash git vim

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

git:
	git/install.sh

vim:
	vim/install.sh
