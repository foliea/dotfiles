#!/bin/sh

sudo pacman -Syu --noconfirm

yaourt -Syu --noconfirm

sh ~/.config/polybar/launch.sh
