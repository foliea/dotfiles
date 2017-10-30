#!/bin/sh
set -e

sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

sudo pacman -Sy --noconfirm

yaourt -Sy --noconfirm

for package in networkmanager \
    manjaro-base-skel \
    manjaro-system \
    manjaro-keyring \
    manjaro-release \
    manjaro-hotfixes \
    manjaro-firmware \
    manjaro-pulse \
    manjaro-printer \
    i3-gaps \
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
    zenity \
    xorg-server \
    xorg-server-xephyr \
    xorg-xinit \
    xorg-xrandr \
    xorg-xbacklight \
    gtk2 \
    gtk3 \
    gtk-engine-murrine \
    lightdm \
    lightdm-gtk-greeter \
    light-locker \
    plymouth \
    blueman \
    lxinput \
    xdg-su \
    xdg-user-dirs \
    xdg-utils \
    xf86-video-intel \
    xf86-input-synaptics \
    redshift \
    tlp \
    tlp-rdw \
    acpid \
    udiskie \
    alsa-utils \
    alsa-firmware \
    pulseaudio-alsa \
    pa-applet \
    pavucontrol \
    numix-gtk-theme \
    numix-icon-theme-git \
    numix-cursor-theme-git \
    pango \
    ttf-font-awesome \
    ttf-opensans \
    ttf-dejavu \
    terminus-font \
    terminator \
    google-chrome \
    slack-desktop \
    transmission-gtk \
    qutebrowser \
    python-opengl \
    qt5-webengine \
    qt5-webengine-widevine \
    qt5-styleplugins \
    viewnior \
    epdfview \
    mpv \
    galculator \
    unzip \
    yubikey-manager \
    pcsc-tools \
    ccid \
    libusb-compat \
    gnupg2 \
    pam \
    pass \
    rofi-pass
do
    $PWD/bin/install-package.sh $package
done
