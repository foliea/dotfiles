#!/bin/sh
set -e

tmp="$HOME/.local/share/nvim/tmp"

mkdir -p $tmp/backup
mkdir -p $tmp/swap
mkdir -p $tmp/undo

rm -rf "$HOME/.config/nvim"
ln -sf "$PWD/nvim" "$HOME/.config/nvim"
