#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

ln -sf $PWD/fish $config_dir/

curl https://git.io/fisher --create-dirs -sLo $PWD/fish/functions/fisher.fish

fisher update