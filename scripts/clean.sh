#!/bin/sh
set -e

for file in gitconfig \
            gitignore-global \
            bashrc \
            vimrc \
            bash-git-prompt \
            atom \
            vim \
            vim-go
do
    rm -rf $HOME/.$file
done
