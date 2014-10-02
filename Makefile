# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marin <mravenel@student.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/10/02 11:00:28 by marin             #+#    #+#              #
#    Updated: 2014/10/02 12:12:16 by marin            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CWD=$(PWD)

.PHONY: install mac clean update vim zsh git go

install: clean zsh git vim

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
	ln -s $(CWD)/gvimrc $(HOME)/.gvimrc
	ln -s $(CWD)/fonts $(HOME)/.fonts
	ln -s $(CWD)/marin42.zsh-theme $(ZSH)/themes/marin42.zsh-theme
	cd vim/bundle/YouCompleteMe && sh install.sh

zsh:
	ln -s $(CWD)/zshrc $(HOME)/.zshrc
	
git:
	sh scripts/git.sh

clean:
	rm -f $(HOME)/.fonts
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.gvimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.vim-go
update:
	git submodule foreach git pull origin master

go:
	sh scripts/go.sh
	go get -u code.google.com/p/go.tools/cmd/oracle
	go get -u code.google.com/p/go.tools/cmd/goimports
	go get -u github.com/nsf/gocode
	go get -u github.com/golang/lint/golint
	go get -u github.com/kisielk/errcheck
	go get -u code.google.com/p/rog-go/exp/cmd/godef
	go get -u github.com/jstemmer/gotags
	ln -s $(GOPATH)/bin $(HOME)/.vim-go
