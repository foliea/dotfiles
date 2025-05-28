.PHONY: all re clean test bash git vim vifm tmux vscode

all: git vim tmux bash vifm vscode

re: clean all

clean:
	scripts/clean.sh

test:
	scripts/test.exp

bash:
	bash/install.sh

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
