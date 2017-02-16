#!/bin/sh
set -e

for file in gitconfig \
            gitignore-global \
            bashrc \
            bash-git-prompt \
            vimrc \
            vim \
            vim-go \
            fzf \
            tmux.conf \
            tmux-colors.conf \
            atom
do
    rm -rf $HOME/.$file
done
