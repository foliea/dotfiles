#!/bin/sh
set -e

mkdir -p $HOME/.config/btop/themes

ln -sf "$PWD/tuis/btop/btop.conf" $HOME/.config/btop/btop.conf
ln -sf "$PWD/tuis/btop/themes/tomorrow-night-eighties.theme" $HOME/.config/btop/themes/tomorrow-night-eighties.theme

