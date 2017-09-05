#!/bin/sh
set -e

for file in i3 \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/terminator \
    config/dunst \
    config/gtk-3.0
do
    rm -rf $HOME/.$file
done

rm $HOME/.Xresources
