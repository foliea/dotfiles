#!/bin/sh
set -e

for file in gitconfig \
            gitignore-global \
            vimrc \
            vim \
            vim-go \
            fzf \
            tmux.conf \
            tmux-colors.conf \
            config/fish
do
    rm -rf $HOME/.$file
done
