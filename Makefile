CWD=$(shell pwd)

.PHONY: all re install update clean bash git vim

all: install bash git vim

re: clean all

install:
	git submodule update --init --recursive

update:
	git submodule foreach git pull origin master

clean:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.bashrc
	rm -rf $(HOME)/.bash-git-prompt
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.vim-go
	rm -f $(HOME)/.git-completion.bash

bash:
	ln -s $(CWD)/bash-git-prompt $(HOME)/.bash-git-prompt
	ln -s $(CWD)/bashrc $(HOME)/.bashrc

git:
	ln -s $(CWD)/git-completion.bash $(HOME)/.git-completion.bash
	scripts/git.sh

vim:
	mkdir -p $(CWD)/vim/tmp/backup
	mkdir -p $(CWD)/vim/tmp/swap
	mkdir -p $(CWD)/vim/tmp/undo
	ln -s $(CWD)/vim $(HOME)/.vim
	ln -s $(CWD)/vimrc $(HOME)/.vimrc
	cd vim/bundle/YouCompleteMe && sh install.sh
