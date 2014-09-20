CWD=$(shell pwd)

.PHONY: install mac clean update vim bash git go

install: clean bash git vim

mac:
	xcode-select --install
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	"$(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"
	brew bundle

vim:
	git submodule update --init --recursive
	mkdir -p $(CWD)/vim/tmp/backup
	mkdir -p $(CWD)/vim/tmp/swap
	mkdir -p $(CWD)/vim/tmp/undo	
	ln -s $(CWD)/vim $(HOME)/.vim
	ln -s $(CWD)/vimrc $(HOME)/.vimrc
	cd vim/bundle/YouCompleteMe && sh install.sh

bash:
	ln -s $(CWD)/bashrc $(HOME)/.bashrc
	
git:
	ln -s $(CWD)/gitconfig $(HOME)/.gitconfig
	ln -s $(CWD)/git-completion.bash $(HOME)/.git-completion.bash

clean:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.vim-go
	rm -f $(HOME)/.git-completion.bash
update:
	git submodule foreach git pull origin master

go:
	scripts/go.sh
	go get -u code.google.com/p/go.tools/cmd/oracle
	go get -u code.google.com/p/go.tools/cmd/goimports
	go get -u github.com/nsf/gocode
	go get -u github.com/golang/lint/golint
	go get -u github.com/kisielk/errcheck
	go get -u code.google.com/p/rog-go/exp/cmd/godef
	go get -u github.com/jstemmer/gotags
	ln -s $(GOPATH)/bin $(HOME)/.vim-go
