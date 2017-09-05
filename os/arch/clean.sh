#!/bin/sh
set -e

for file in i3 \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/terminator \
    config/dunst
do
    rm -rf $HOME/.$file
done

rm $HOME/.Xresources
