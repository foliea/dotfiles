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
	firegrid; do
	ln -s $PWD/config/$file $config_dir/
done

for file in Xresources \
	Xresources.d \
	Xmodmap \
	xprofile \
	dmrc \
	gtkrc-2.0 \
	gnupg \
	grip \
	pam_environment; do
	ln -s $PWD/config/$file $HOME/.$file
done

mkdir -p $HOME/.local/share/applications

for file in tui dev slack qutebrowser system-update system-config-printer gparted Zoom; do
	ln -s $PWD/applications/$file.desktop $HOME/.local/share/applications/$file.desktop
done

# Link custom binaries
ln -s $PWD/bin $HOME/.local/bin

# Link usb storage to user directory
ln -s /run/media/$USER $HOME/Mount

# Link trash
ln -s $HOME/.local/share/vifm/Trash $HOME/Trash

# Transmission is using the same config file to update its own
# variables, making it painful to have it linked to a file from
# source control.
cp -r $PWD/config/transmission $config_dir/

# Pulseaudio as issues with symbolic links
cp -r $PWD/config/pulse $config_dir/pulse

sed -i -e "s/{{USER}}/$USER/" $config_dir/transmission/settings.json 1>/dev/null
