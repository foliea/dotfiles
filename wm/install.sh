#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

ln -s $PWD/i3 $config_dir/
ln -s $PWD/polybar $config_dir/
ln -s $PWD/nitrogen $config_dir/
