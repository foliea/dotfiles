#!/bin/sh
set -e

install_package() {
    package=$1

    if type yaourt > /dev/null; then
        yaourt -S --noconfirm --needed $package
    else
        sudo pacman -S --noconfirm --needed $package
    fi
}

sudo pacman -Sy

for package in i3-gaps \
    nitrogen \
    rofi \
    dunst \
    compton \
    clipit \
    scrot \
    xorg-xbacklight \
    manjaro-pulse \
    pa-applet \
    pavucontrol \
    numix-gtk-theme \
    la-capitaine-icon-theme-git \
    polybar-git \
    ttf-font-awesome \
    terminator \
    google-chrome \
    slack-desktop \
    yakyak
do
    install_package $package
done

sh $PWD/os/arch/clean.sh
sh $PWD/os/arch/link.sh
