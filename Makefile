CWD=$(shell pwd)

.PHONY: all re install update clean test dependencies bash git vim

all: install bash git vim

re: clean all

install:
	hack/install.sh

update:
	hack/update.sh

clean:
	hack/clean.sh

test:
	hack/test.sh

dependencies:
	hack/dependencies.sh

bash:
	bash/install.sh

git:
	git/install.sh

vim:
	vim/install.sh
	
