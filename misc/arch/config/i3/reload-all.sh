#!/bin/sh

switch-dpi

xrdb -merge ~/.Xresources

i3-msg restart

$HOME/.config/i3/status-bar.sh

load-keyboard-layout

nitrogen --restore

pkill dunst
