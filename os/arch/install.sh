#!/bin/sh
set -e

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
    xorg-server \
    xorg-server-xephyr \
    xorg-xinit \
    xorg-xrandr \
    xorg-xbacklight \
    gtk2 \
    gtk3 \
    lightdm \
    lightdm-gtk-greeter \
    light-locker \
    blueman \
    lxinput \
    xdg-su \
    xdg-user-dirs \
    xdg-utils \
    xflux \
    xf86-video-intel \
    xf86-input-synaptics \
    acpid \
    alsa-utils \
    alsa-firmware \
    pulseaudio-alsa \
    pa-applet \
    pavucontrol \
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
    mpv \
    yakyak \
    yubikey-manager \
    pcsc-tools \
    ccid \
    libusb-compat \
    gnupg2 \
    pam
do
    sh $PWD/os/arch/install-package.sh $package
done

sh $PWD/os/arch/clean.sh
sh $PWD/os/arch/link.sh

sudo rm -rf /etc/lightdm
sudo cp -rf $PWD/os/arch/lightdm /etc/lightdm

sudo cp -f $PWD/os/arch/system-update.sh /usr/sbin/system-update

for service in NetworkManager pcscd org.cups.cupsd lightdm ; do
    sudo systemctl enable $service
    sudo systemctl start $service
done

sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

for app in tui dev qutebrowser system-update ; do
    sudo cp -f $PWD/os/arch/applications/$app.desktop /usr/share/applications/
done

sudo rm -rf /etc/X11/xorg.conf.d
sudo cp -rf $PWD/os/arch/misc/xorg.conf.d /etc/X11/

xdg-settings set default-web-browser qutebrowser.desktop
