#!/bin/sh
set -e

sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

sudo pacman -Sy --noconfirm

yaourt -Sy --noconfirm

for package in networkmanager \
    i3-gaps \
    i3-scrot \
    libmpdclient \
    wireless_tools \
    polybar \
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
    xf86-video-intel \
    gtk2 \
    gtk3 \
    gtk-engine-murrine \
    lightdm \
    lightdm-mini-greeter \
    xss-lock \
    terminus-font \
    plymouth \
    plymouth-theme-arch-logo \
    blueman \
    lxinput \
    xdg-user-dirs \
    xdg-utils \
    xf86-input-synaptics \
    redshift \
    tlp \
    tlp-rdw \
    acpid \
    upower \
    udiskie \
    dmidecode \
    alsa-utils \
    alsa-firmware \
    pulseaudio-alsa \
    pavucontrol \
    cups \
    system-config-printer \
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
    peerflix \
    viewnior \
    zathura \
    zathura-pdf-poppler \
    mpv \
    galculator \
    unzip \
    p7zip \
    gparted \
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

$PWD/bin/install-package --skippgpcheck cower

product_name=$(sudo dmidecode -s system-product-name)

kernel_release="linux$(uname -r | cut -d "." -f1)$(uname -r | cut -d "." -f2)"

if [ "$product_name" == "XPS 15 9560" ]; then
    for package in $kernel_release-acpi_call xf86-video-intel; do
        $PWD/bin/install-package $package
    done
fi
