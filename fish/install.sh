#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

ln -s $PWD/fish $config_dir/

chsh -s $(`which fish`) $USER
