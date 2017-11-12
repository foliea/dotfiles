#!/bin/sh
set -e

function config() {
    sudo cp -f $PWD/config/gtk-3.0/* /etc/gtk-3.0/
    sudo cp -f $PWD/config/gtkrc-2.0 /etc/gtk-2.0/gtkrc
}

function dpi() {
    read -p "Please specify internal default dpi: " dpi

    sudo mkdir -p /opt/default

    sudo bash -c "echo '$dpi' > /opt/default/internal-dpi"
}

function display() {
    sudo rm -rf /etc/lightdm
    sudo cp -rf $PWD/etc/lightdm /etc/

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

function boot() {
    for file in mkinitcpio.conf plymouth ; do
        sudo cp -rf $PWD/etc/$file /etc/
    done

    local kernel=$(uname -r | cut -c 1,3,4)

    sudo mkinitcpio -p "linux$kernel"

    # Fix suspend loop issue, fix screen flickering and add plymouth splash
    sudo sed -i -e \
        's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.enable_rc6=0 i915.enable_psr=0 button.lid_init_state=open"/' \
        /etc/default/grub 1>/dev/null

    sudo grub-mkconfig -o /boot/grub/grub.cfg

    sudo plymouth-set-default-theme -R solar
}

function services() {
    for service in NetworkManager pcscd org.cups.cupsd tlp lightdm-plymouth ; do
        sudo systemctl enable $service
    done
}

$1
