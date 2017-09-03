#!/bin/sh
set -e

pacman -Sy --noconfirm \
    i3-gaps \
    nitrogen \
    xorg-xbacklight \
    numix-gtk-theme \
    capitaine-icon-theme-git

sh install_pulse
