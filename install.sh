#!/bin/sh

git submodule update --init --recursive

# Git config
ln -s $PWD/gitconfig $HOME/.gitconfig
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $HOME/.git-completion.bash

# Bash profile
ln -s $PWD/bashrc $HOME/.bashrc
source $HOME/.bashrc

# Vim config
mkdir -p vim/tmp/backup
mkdir -p vim/tmp/swap
mkdir -p vim/tmp/undo

mkdir -p $HOME/.vim-go

ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vimrc $HOME/.vimrc

# Install YouCompleteMe
cd vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
