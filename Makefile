CWD=$(shell pwd)
BINDIR=$(HOME)/bin

.PHONY: docker container install clean update vim bash git go

docker:
	docker build -t dev .

container:
	docker run -v $(HOME)/Dev/docker:/go/src/github.com/dotcloud/docker --privileged -i -t dev

install: clean go bash git vim

vim:
	git submodule update --init --recursive
	mkdir -p $(CWD)/vim/tmp/backup
	mkdir -p $(CWD)/vim/tmp/swap
	mkdir -p $(CWD)/vim/tmp/undo
	mkdir -p $(HOME)/.vim-go
	ln -s $(CWD)/vim $HOME/.vim
	ln -s $(CWD)/vimrc $HOME/.vimrc
	cd vim/bundle/YouCompleteMe
	git submodule update --init --recursive
	install.sh --clang-completer

bash:
	ln -s $(CWD)/bashrc $(HOME)/.bashrc
	
git:
	ln -s $(CWD)/gitconfig $(HOME)/.gitconfig

clean:
	rm $(HOME)/.gitconfig
	rm $(HOME)/.bashrc
	rm $(HOME)/.vimrc
	rm $(HOME)/.vim

update:
	git submodule foreach git pull origin master
	cd $(CWD)/vim/bundle/YouCompleteMe
	git submodule foreach git pull origin master

go:
	go get -u code.google.com/p/go.tools/cmd/godoc
	go get -u code.google.com/p/go.tools/cmd/oracle
	go get -u code.google.com/p/go.tools/cmd/goimports
	go get -u github.com/nsf/gocode
	go get -u github.com/golang/lint/golint
	go get -u github.com/kisielk/errcheck
	go get -u code.google.com/p/rog-go/exp/cmd/godef
	go get -u github.com/jstemmer/gotags
	go get -u github.com/monochromegane/the_platinum_searcher
	rm -rf $(BINDIR)/oracle $(BINDIR)/goimports $(BINDIR)/golint $(BINDIR)/errcheck $(BINDIR)/gocode $(BINDIR)/godef $(BINDIR)/gotags $(BINDIR)/pt
	ln -s $(GOPATH)/bin/oracle $(BINDIR)
	ln -s $(GOPATH)/bin/goimports $(BINDIR)
	ln -s $(GOPATH)/bin/golint $(BINDIR)
	ln -s $(GOPATH)/bin/errcheck $(BINDIR)
	ln -s $(GOPATH)/bin/gocode $(BINDIR)
	ln -s $(GOPATH)/bin/godef $(BINDIR)
	ln -s $(GOPATH)/bin/gotags $(BINDIR)
	ln -s $(GOPATH)/bin/the_platinum_searcher $(BINDIR)/pt
