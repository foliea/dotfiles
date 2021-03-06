#!/bin/sh
set -e

echo $PWD

tmp="$PWD/vim/tmp"

mkdir -p $tmp/backup
mkdir -p $tmp/swap
mkdir -p $tmp/undo

ln -s $PWD/vim/ $HOME/.vim
ln -s $PWD/vim/tern-config $HOME/.tern-config

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
