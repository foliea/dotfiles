#!/bin/sh
set -e

rm -rf "$HOME/.config/nvim"
cp -r "$PWD/nvim" "$HOME/.config/nvim"