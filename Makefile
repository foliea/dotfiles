.PHONY: all re clean test fish git vim vifm tmux cursor

all: git vim tmux fish vifm cursor

re: clean all

clean:
	scripts/clean.sh

test:
	scripts/test.exp

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

cursor:
	cursor/install.sh
