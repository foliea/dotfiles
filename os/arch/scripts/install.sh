#!/bin/sh
set -e

function config() {
    sudo cp -f $HOME/.config/gtk-3.0/* /etc/gtk-3.0/
    sudo cp -f $HOME/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
}

function dpi() {
    read -p "Please specify internal default dpi: " dpi

    sudo mkdir -p /opt/default

    sudo bash -c "echo '$dpi' > /opt/default/internal-dpi"
}

function display() {
    sudo rm -rf /etc/lightdm
    sudo cp -rf $PWD/etc/lightdm /etc/lightdm

    sudo sed -i -e \
        "s/#autologin-user={{USER}}/autologin-user=$USER/" \
        /etc/lightdm/lightdm.conf 1>/dev/null

    sudo rm -rf /etc/X11/xorg.conf.d
    sudo cp -rf $PWD/etc/xorg.conf.d /etc/X11/
}

function autologin() {
    getent group autologin || sudo groupadd -r autologin
    sudo gpasswd -a $USER autologin
}

function binaries() {
    for binary in askpass system-update switch-dpi switch-monitor launch-qt5-app install-package ; do
        sudo cp -f $PWD/bin/$binary.sh /usr/local/bin/$binary
    done

    for app in tui dev qutebrowser system-update ; do
        sudo cp -f $PWD/applications/$app.desktop /usr/share/applications/
    done

    xdg-settings set default-web-browser qutebrowser.desktop
}

function boot() {
    sudo cp -f $PWD/etc/mkinitcpio.conf /etc/mkinitcpio.conf

    local kernel=$(uname -r | cut -c 1,3,4)

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

eval "$1"