.PHONY: all re clean test fish git vim vifm tmux vscode

all: git vim tmux bash vifm vscode

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

vscode:
	vscode/install.sh
