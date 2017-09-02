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
            config/fish \
            config/prompt \
            config/i3 \
            config/polybar \
            config/nitrogen \
            config/terminator
do
    rm -rf $HOME/.$file
done

rm -rf tmux/plugins/tpm
