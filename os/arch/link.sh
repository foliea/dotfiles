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
    compton.conf \
    clipit \
    qutebrowser
do
    ln -s $PWD/os/arch/$file $config_dir/
done

for file in Xresources \
    dmrc \
    gtkrc-2.0 \
    gnupg \
    pam_environment
do
    ln -s $PWD/os/arch/root/$file $HOME/.$file
done

ln -s /run/media/$USER $HOME/Mount

# Transmission is using the same config file to update its own
# variables, making it painful to have linked to a file in source
# control.
cp -r $PWD/os/arch/transmission $config_dir/

sed -i -e "s/{{USER}}/$USER/" $config_dir/transmission/settings.json 1>/dev/null
