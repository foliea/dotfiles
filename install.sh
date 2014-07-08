#!/bin/sh

# Git config
ln -s gitconfig $HOME/.gitconfig

# Bash profile
ln -s bashrc $HOME/.bashrc
source $HOME/.bashrc

# Vim config
mkdir -p vim/tmp/backup
mkdir -p vim/tmp/swap
mkdir -p vim/tmp/undo

mkdir -p $HOME/.vim-go

ln -s vim $HOME/.vim
ln -s vimrc $HOME/.vimrc

# Install YouCompleteMe
cd vim/bundle/YouCompleteMe
./install.sh --clang-completer
