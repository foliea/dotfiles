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
    config/zathura \
    config/mimeapps.list \
    Xresources \
    Xresources.d \
    Xmodmap \
    xprofile \
    dmrc \
    gtkrc-2.0 \
    gnupg \
    pam_environment
do
    rm -rf $HOME/.$file
done

for file in tui dev qutebrowser system-update ; do
    rm -rf $HOME/.local/share/applications/$file.desktop
done

rm -rf $HOME/Mount
