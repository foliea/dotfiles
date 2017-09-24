.PHONY: all re clean test dependencies fish git vim vifm tmux

all: git vim tmux fish vifm

re: clean all

clean:
	scripts/clean.sh

test:
	scripts/test.exp

dependencies:
	os/install.sh

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
