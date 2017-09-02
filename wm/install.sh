#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

for file in i3 polybar nitrogen ; do
    ln -s $PWD/wm/$file $config_dir/
done
