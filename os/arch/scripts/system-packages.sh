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
    libmpdclient \
    wireless_tools \
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
    lightdm-mini-greeter \
    xss-lock \
    terminus-font \
    otf-ipafont \
    plymouth \
    plymouth-theme-manjaro \
    blueman \
    lxinput \
    xdg-su \
    xdg-user-dirs \
    xdg-utils \
    xf86-input-synaptics \
    redshift \
    tlp \
    tlp-rdw \
    acpid \
    udiskie \
    dmidecode \
    alsa-utils \
    alsa-firmware \
    pulseaudio-alsa \
    pa-applet \
    pavucontrol \
    numix-gtk-theme \
    numix-icon-theme-git \
    numix-cursor-theme-git \
    pango \
    noto-fonts \
    noto-fonts-emoji \
    ttf-font-awesome \
    ttf-dejavu \
    terminator \
    firefox-developer-edition \
    chromium \
    transmission-gtk \
    qutebrowser \
    python-opengl \
    qt5-webengine \
    qt5-webengine-widevine \
    qt5-styleplugins \
    viewnior \
    zathura \
    zathura-pdf-poppler \
    simple-scan \
    mpv \
    galculator \
    cheese \
    unzip \
    p7zip \
    gparted \
    peerflix \
    caffeine-ng \
    yubikey-manager \
    pcsc-tools \
    ccid \
    libusb-compat \
    gnupg2 \
    pam \
    pass \
    rofi-pass \
    openvpn \
    openresolv
do
    $PWD/bin/install-package $package
done

# Build polybar after to ensure that libmpdclient is installed.
$PWD/bin/install-package polybar

yaourt -S --m-arg --skippgpcheck --noconfirm cower
