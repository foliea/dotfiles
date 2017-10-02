#!/bin/sh
set -e

function packages() {
    sh $PWD/os/arch/system-packages.sh
}

function config() {
    sh $PWD/os/arch/clean.sh
    sh $PWD/os/arch/link.sh
}

function dpi() {
    read -p "Please specify default dpi: " dpi

    sudo mkdir -p /opt/default

    sudo bash -c "echo '$dpi' > /opt/default/dpi"

    sh $PWD/os/arch/switch-dpi.sh
}

function display() {
    sudo rm -rf /etc/lightdm
    sudo cp -rf $PWD/os/arch/misc/lightdm /etc/lightdm

    sudo rm -rf /etc/X11/xorg.conf.d
    sudo cp -rf $PWD/os/arch/misc/xorg.conf.d /etc/X11/
}

function autologin() {
    getent group autologin || sudo groupadd -r autologin
    sudo gpasswd -a foliea autologin
}

function binaries() {
    for binary in system-update switch-dpi switch-monitor launch-qt5-app install-package ; do
        sudo cp -f $PWD/os/arch/$binary.sh /usr/local/bin/$binary
    done

    for app in tui dev qutebrowser system-update ; do
        sudo cp -f $PWD/os/arch/misc/applications/$app.desktop /usr/share/applications/
    done

    xdg-settings set default-web-browser qutebrowser.desktop
}

function boot() {
    sudo cp -f $PWD/os/arch/misc/mkinitcpio.conf /etc/mkinitcpio.conf

    kernel=$(uname -r | cut -c 1,3,4)

    sudo mkinitcpio -p "linux$kernel"

    # Fix suspend loop issue, fix screen flickering and add plymouth splash
    sudo sed -i -e \
        's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.enable_rc6=0 i915.enable_psr=0 button.lid_init_state=open"/' \
        /etc/default/grub 1>/dev/null

    sudo grub-mkconfig -o /boot/grub/grub.cfg
}

function services() {
    for service in NetworkManager pcscd org.cups.cupsd tlp lightdm-plymouth ; do
        sudo systemctl enable $service
    done
}

function all() {
    packages
    config
    dpi
    display
    autologin
    binaries
    boot
    services
}

eval "$1"
