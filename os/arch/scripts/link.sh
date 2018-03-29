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
    qutebrowser \
    zathura \
    mimeapps.list \
    firegrid
do
    ln -s $PWD/config/$file $config_dir/
done

for file in Xresources \
    Xresources.d \
    Xmodmap \
    xprofile \
    dmrc \
    gtkrc-2.0 \
    gnupg \
    pam_environment
do
    ln -s $PWD/config/$file $HOME/.$file
done

mkdir -p $HOME/.local/share/applications

for file in tui dev qutebrowser system-update gparted ; do
    ln -s $PWD/applications/$file.desktop $HOME/.local/share/applications/$file.desktop
done

# Link custom binaries
ln -s $PWD/bin $HOME/.local/bin

# Link usb storage to user director
ln -s /run/media/$USER $HOME/Mount

# Link trash
ln -s $HOME/.local/share/vifm/Trash $HOME/Trash

# Transmission is using the same config file to update its own
# variables, making it painful to it have linked to a file from
# source control.
cp -r $PWD/config/transmission $config_dir/

sed -i -e "s/{{USER}}/$USER/" $config_dir/transmission/settings.json 1>/dev/null
