#!/bin/sh
set -e

package=$1

if type yaourt > /dev/null; then
    yaourt -S --noconfirm --needed $package
else
    sudo pacman -S --noconfirm --needed $package
fi
