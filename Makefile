CWD=$(shell pwd)
BINDIR=$(HOME)/bin

.PHONY: docker container install clean update vim bash git go

docker:
	docker build -t dev .

container:
	docker run -v $(HOME)/dev/docker:/go/src/github.com/dotcloud/docker --privileged -i -t dev /bin/bash

install: clean bash git vim

vim: go
	git submodule update --init --recursive
	mkdir -p $(CWD)/vim/tmp/backup
	mkdir -p $(CWD)/vim/tmp/swap
	mkdir -p $(CWD)/vim/tmp/undo
	ln -s $(GOPATH)/bin $(HOME)/.vim-go
	ln -s $(CWD)/vim $(HOME)/.vim
	ln -s $(CWD)/vimrc $(HOME)/.vimrc
	cd $(CWD)/vim/bundle/YouCompleteMe && sh install.sh

bash:
	ln -s $(CWD)/bashrc $(HOME)/.bashrc
	
git:
	ln -s $(CWD)/gitconfig $(HOME)/.gitconfig
	ln -s $(CWD)/git-completion.bash $(HOME)/.git-completion.bash

clean:
	rm -rf $(CWD)/vim/bundle/*
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.vim
	rm -f $(HOME)/.vim-go

update:
	git submodule foreach git pull origin master

go:
	$(CWD)/scripts/go.sh
	go get -u code.google.com/p/go.tools/cmd/oracle
	go get -u code.google.com/p/go.tools/cmd/goimports
	go get -u github.com/nsf/gocode
	go get -u github.com/golang/lint/golint
	go get -u github.com/kisielk/errcheck
	go get -u code.google.com/p/rog-go/exp/cmd/godef
	go get -u github.com/jstemmer/gotags
