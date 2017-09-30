#!/bin/sh

# Fix suspend loop issue
sudo sed 's/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=quiet button.lid_init_state=open/' /etc/default/grub > /dev/null

sudo grub-mkconfig -o /boot/grub/grub.cfg
