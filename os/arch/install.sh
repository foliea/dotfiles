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
    xflux \
    xf86-video-intel \
    xf86-input-synaptics \
    tlp \
    tlp-rdw \
    acpid \
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
    viewnior \
    epdfview \
    mpv \
    galculator \
    yubikey-manager \
    pcsc-tools \
    ccid \
    libusb-compat \
    gnupg2 \
    pam \
    pass
do
    sh $PWD/os/arch/install-package.sh $package
done

sh $PWD/os/arch/clean.sh
sh $PWD/os/arch/link.sh

read -p "Please specify default dpi: " dpi

sudo mkdir -p /opt/default

sudo bash -c "echo '$dpi' > /opt/default/dpi"

sh $PWD/os/arch/switch-dpi.sh

sudo rm -rf /etc/lightdm
sudo cp -rf $PWD/os/arch/misc/lightdm /etc/lightdm

getent group autologin || sudo groupadd -r autologin
sudo gpasswd -a foliea autologin

for binary in system-update switch-dpi switch-monitor launch-qt5-app ; do
    sudo cp -f $PWD/os/arch/$binary.sh /usr/local/bin/$binary
done

sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

for app in tui dev qutebrowser system-update ; do
    sudo cp -f $PWD/os/arch/misc/applications/$app.desktop /usr/share/applications/
done

sudo rm -rf /etc/X11/xorg.conf.d
sudo cp -rf $PWD/os/arch/misc/xorg.conf.d /etc/X11/

xdg-settings set default-web-browser qutebrowser.desktop

sudo cp -f $PWD/os/arch/misc/mkinitcpio.conf /etc/mkinitcpio.conf

read -p "Please specify linux kernel (e.g 413): " kernel

sudo mkinitcpio -p "linux$kernel"

# Fix suspend loop issue, fix screen flickering and add plymouth splash
sudo sed -i -e \
    's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.enable_rc6=0 i915.enable_psr=0 button.lid_init_state=open"/' \
    /etc/default/grub 1>/dev/null

sudo grub-mkconfig -o /boot/grub/grub.cfg

for service in NetworkManager pcscd org.cups.cupsd tlp lightdm-plymouth ; do
    sudo systemctl enable $service
done
