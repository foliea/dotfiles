# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marin <mravenel@student.42.fr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/10/02 11:00:28 by marin             #+#    #+#              #
#    Updated: 2014/11/04 12:19:58 by modizy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CWD=$(PWD)

.PHONY: install mac clean update vim zsh git go fonts

install: clean fonts zsh git vim

mac:
	xcode-select --install
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	"$(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"
	brew bundle

fonts:
	ln -s $(CWD)/fonts $(HOME)/.fonts

vim:
	git submodule update --init --recursive
	mkdir -p $(CWD)/vim/tmp/backup
	mkdir -p $(CWD)/vim/tmp/swap
	mkdir -p $(CWD)/vim/tmp/undo	
	ln -s $(CWD)/vim $(HOME)/.vim
	ln -s $(CWD)/vimrc $(HOME)/.vimrc
	ln -s $(CWD)/gvimrc $(HOME)/.gvimrc
	ln -s $(CWD)/marin42.zsh-theme $(ZSH)/themes/marin42.zsh-theme
	cp -f $(CWD)/airline-gruvbox.vim $(CWD)/vim/bundle/vim-airline/autoload/airline/themes/gruvbox.vim

zsh:
	ln -s $(CWD)/zshrc $(HOME)/.zshrc
	
git:
	sh scripts/git.sh

clean:
	rm -rf $(HOME)/.fonts
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.vimrc
	rm -f $(ZSH)/themes/marin42.zsh-theme
	rm -f $(HOME)/.gvimrc
	rm -rf $(HOME)/.vim
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
