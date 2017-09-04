#!/bin/sh
set -e

for file in gitconfig \
            gitignore-global \
            vimrc \
            vim \
            vifmrc \
            vifm \
            vim-go \
            fzf \
            tmux.conf \
            tmux \
            config/fish
do
    rm -rf $HOME/.$file
done

rm -rf tmux/plugins/tpm
