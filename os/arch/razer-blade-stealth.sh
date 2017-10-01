#!/bin/sh

sudo pacman -S --noconfirm --needed plymouth

sudo cp -f $PWD/os/arch/misc/mkinitcpio.conf /etc/mkinitcpio.conf

sudo mkinitcpio -p linux413

# Fix suspend loop issue and add plymouth splash
sudo sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash button.lid_init_state=open"/' /etc/default/grub > /dev/null

sudo grub-mkconfig -o /boot/grub/grub.cfg
