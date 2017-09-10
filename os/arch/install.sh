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
    i3lock-color-git \
    i3lock-fancy-git \
    polybar-git \
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
    numix-icon-theme-git \
    ttf-font-awesome \
    terminator \
    google-chrome \
    slack-desktop \
    transmission-gtk \
    yakyak
do
    install_package $package
done

sh $PWD/os/arch/clean.sh
sh $PWD/os/arch/link.sh
