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
            atom \
            tmux.conf \
            tmux-colors.conf
do
    rm -rf $HOME/.$file
done
