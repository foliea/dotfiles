#!/bin/sh
set -e

echo $PWD

tmp="$PWD/vim/tmp"

mkdir -p $tmp/backup
mkdir -p $tmp/swap
mkdir -p $tmp/undo

ln -s $PWD/vim/ $HOME/.vim
ln -s $PWD/vim/vimrc $HOME/.vimrc
ln -s $PWD/vim/fzf $HOME/.fzf
