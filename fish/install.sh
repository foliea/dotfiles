#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

rm -rf "$config_dir/fish"
ln -sf $PWD/fish "$config_dir/fish"

curl https://git.io/fisher --create-dirs -sLo $PWD/fish/functions/fisher.fish

fish -c 'fisher update'
