#!/bin/sh
set -e

tmp="$HOME/.local/share/nvim/tmp"

mkdir -p $tmp/backup
mkdir -p $tmp/swap
mkdir -p $tmp/undo

ln -sf "$PWD/nvim" "$HOME/.config/nvim"

# Install plugins
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall --sync' +qa
