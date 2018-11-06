#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

ln -s $PWD/fish $config_dir/

curl https://git.io/fisher --create-dirs -sLo $config_dir/functions/fisher.fish
