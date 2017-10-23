#!/bin/sh
set -e

for file in i3 \
    config/i3 \
    config/polybar \
    config/nitrogen \
    config/fontconfig \
    config/terminator \
    config/dunst \
    config/clipit \
    config/gtk-3.0 \
    config/transmission \
    config/compton.conf \
    config/qutebrowser \
    Xresources \
    Xresources.d \
    dmrc \
    gtkrc-2.0 \
    gnupg \
    pam_environment
do
    rm -rf $HOME/.$file
done

rm -rf $HOME/Mount
