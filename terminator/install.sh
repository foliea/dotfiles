#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

ln -s $PWD/terminator $config_dir/