.PHONY: all re install update clean test dependencies dev bash git vim

all: install bash git vim

re: clean all

install:
	scripts/install.sh

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
