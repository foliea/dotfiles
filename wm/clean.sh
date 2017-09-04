#!/bin/sh
set -e

for file in config/fish \
    config/prompt \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/terminator
do
    rm -rf $HOME/.$file
done

rm $HOME/.Xresources
