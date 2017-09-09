#!/bin/sh
set -e

for file in i3 \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/terminator \
    config/dunst \
    config/clipit \
    config/gtk-3.0 \
    config/transmission \
    config/compton.conf \
    Xresources \
    gtkrc-2.0
do
    rm -rf $HOME/.$file
done
