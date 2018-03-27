#!/bin/sh
set -e

function config() {
    sudo mkdir -p /usr/share/backgrounds
    sudo cp -f $PWD/config/gtk-3.0/* /etc/gtk-3.0/
    sudo cp -f $PWD/config/gtkrc-2.0 /etc/gtk-2.0/gtkrc
    sudo cp -f $PWD/backgrounds/* /usr/share/backgrounds/
    sudo cp -f $PWD/etc/udev/rules.d/* /etc/udev/rules.d/
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
        "s/autologin-user={{USER}}/autologin-user=$USER/" \
        /etc/lightdm/lightdm.conf 1>/dev/null

    sudo sed -i -e \
        "s/user = {{USER}}/user = $USER/" \
        /etc/lightdm/lightdm-mini-greeter.conf 1>/dev/null

    sudo rm -rf /etc/X11/xorg.conf.d
    sudo cp -rf $PWD/etc/xorg.conf.d /etc/X11/
}

function permissions() {
    getent group autologin || sudo groupadd -r autologin
    sudo gpasswd -a $USER autologin

    getent group plugdev || sudo groupadd -r plugdev
    sudo gpasswd -a $USER plugdev
}

function boot() {
    for file in mkinitcpio.conf plymouth ; do
        sudo cp -rf $PWD/etc/$file /etc/
    done

    sudo plymouth-set-default-theme -R manjaro-logo

    local model=$(sudo dmidecode -s system-product-name)

    if [ "$model" == "Blade Stealth" ]; then
        # Fix suspend loop issue, fix screen flickering and add plymouth splash
        sudo sed -i -e \
            's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.enable_rc6=0 i915.enable_psr=0 button.lid_init_state=open"/' \
            /etc/default/grub 1>/dev/null
    fi
    read -p "Do you want to install Dell XPS 15 9560 boot options: " choice
    if [ "$choice" == "y" ]; then
        sudo sed -i -e \
            "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet pcie_port_pm=off acpi_backlight=none acpi_osi=Linux acpi_osi=! acpi_osi='Windows 2009'\"/" \
            /etc/default/grub 1>/dev/null
    fi

    sudo sed -i -e \ 's/GRUB_GFXMODE=.*/GRUB_GFXMODE="3200x1800x32,auto"/' /etc/default/grub 1>/dev/null

    local hidden_menu=$(cat /etc/default/grub | grep "GRUB_FORCE_HIDDEN_MENU")

    if [ -z "$hidden_menu" ]; then
        sudo bash -c "echo GRUB_FORCE_HIDDEN_MENU=\"true\" >> /etc/default/grub"
    fi

    sudo cp $PWD/etc/grub.d/* /etc/grub.d/

    sudo grub-mkconfig -o /boot/grub/grub.cfg
}

function services() {
    for service in systemd-rfkill; do
        sudo systemctl mask --now systemd-rfkill.service
        sudo systemctl disable --now systemd-rfkill.socket
    done
    # N.b: tlp.service starts NetworkManager.service if it is available.
    for service in pcscd org.cups.cupsd tlp tlp-sleep lightdm-plymouth ; do
        sudo systemctl enable $service
    done

    sudo cp $PWD/lib/systemd/system-sleep/gpg.sh /usr/lib/systemd/system-sleep/
}

$1
