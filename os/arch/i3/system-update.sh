#!/bin/sh

sudo pacman -Syu --noconfirm

yaourt -Su --aur --noconfirm

sh ~/.config/polybar/launch.sh
