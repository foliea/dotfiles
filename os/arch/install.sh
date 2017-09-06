#!/bin/sh
set -e

install_package() {
    package=$1

    if type yaourt > /dev/null; then
        yaourt -Sy --noconfirm --needed $package
    else
        sudo pacman -Sy --noconfirm --needed $package
    fi
}

for package in i3-gaps \
    nitrogen \
    rofi \
    dunst \
    compton \
    clipit \
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
