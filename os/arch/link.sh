#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

for file in i3 polybar nitrogen terminator dunst gtk-3.0 ; do
    ln -s $PWD/os/arch/$file $config_dir/
done

ln -s $PWD/os/arch/Xresources $HOME/.Xresources
