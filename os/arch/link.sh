#!/bin/sh
set -e

config_dir="$HOME/.config"

mkdir -p $config_dir

for file in i3 \
    polybar \
    nitrogen \
    fontconfig \
    terminator \
    dunst \
    gtk-3.0 \
    transmission \
    compton.conf \
    clipit \
    qutebrowser
do
    ln -s $PWD/os/arch/$file $config_dir/
done

for file in Xresources \
    Xclients \
    xinitrc \
    dmrc \
    gtkrc-2.0 \
    gnupg \
    pam_environment
do
    ln -s $PWD/os/arch/root/$file $HOME/.$file
done
