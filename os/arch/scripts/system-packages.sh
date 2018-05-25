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
    otf-ipafont \
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

wget https://github.com/erroneousboat/slack-term/releases/download/v0.4.1/slack-term-linux-amd64 && \
    chmod +x slack-term-linux-amd64 && \
    sudo mv slack-term-linux-amd64 /usr/local/bin/slack-term
