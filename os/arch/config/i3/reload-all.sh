#!/bin/sh

xrdb -merge ~/.Xresources

i3-msg restart

$HOME/.config/i3/polybar.sh

$HOME/.config/i3/switch-keyboard-layout.sh

nitrogen --restore

pkill dunst
