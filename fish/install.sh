#!/bin/sh
set -e

CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

rm -rf "$CONFIG_DIR/fish"
ln -sf "$PWD/fish" "$CONFIG_DIR/fish"

curl https://git.io/fisher --create-dirs -sLo "$PWD/fish/functions/fisher.fish"

fish -c 'fisher update'
