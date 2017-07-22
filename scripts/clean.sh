#!/bin/sh
set -e

for file in gitconfig \
            gitignore-global \
            vimrc \
            vim \
            vim-go \
            fzf \
            tmux.conf \
            tmux \
            config/fish \
            config/prompt
do
    rm -rf $HOME/.$file
done

rm -rf tmux/plugins/tpm
