#!/bin/sh
set -e

for file in i3 \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/terminator
do
    rm -rf $HOME/.$file
done

rm $HOME/.Xresources
