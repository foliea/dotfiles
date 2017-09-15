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
    i3-scrot \
    i3exit \
    conky-i3 \
    polybar-git \
    cower \
    nitrogen \
    rofi \
    dunst \
    compton \
    clipit \
    xorg-xbacklight \
    xorg-server-xephyr \
    lightdm \
    gtk2 \
    gtk3 \
    manjaro-base-skel \
    manjaro-system \
    manjaro-keyring \
    manjaro-printer \
    manjaro-release \
    manjaro-hotfixes \
    manjaro-firmware \
    manjaro-settings-manager \
    manjaro-settings-manager-notifier \
    alsa-utils \
    alsa-firmware \
    pulseaudio-alsa \
    manjaro-pulse \
    pa-applet \
    pavucontrol \
    xfce4-power-manager \
    numix-gtk-theme \
    numix-icon-theme-git \
    numix-cursor-theme-git \
    ttf-font-awesome \
    ttf-opensans \
    terminator \
    google-chrome \
    slack-desktop \
    transmission-gtk \
    qutebrowser \
    python-opengl \
    qt5-webengine \
    viewnior \
    epdfview \
    yakyak
do
    install_package $package
done

sh $PWD/os/arch/clean.sh
sh $PWD/os/arch/link.sh

sudo rm -rf /etc/lightdm
sudo cp -rf $PWD/os/arch/lightdm /etc/lightdm

sudo cp -f $PWD/os/arch/system-update.sh /usr/sbin/system-update

for app in tui dev qutebrowser system-update ; do
    sudo cp -f $PWD/os/arch/applications/$app.desktop /usr/share/applications/
done
