.PHONY: all re prepare update clean test dependencies dev bash git vim atom

all: prepare bash git vim atom

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
	scripts/dependencies.sh

dev:
	scripts/dev.sh

bash:
	bash/install.sh

git:
	git/install.sh

vim:
	vim/install.sh

atom:
	ln -s $(PWD)/atom/ $(HOME)/.atom
