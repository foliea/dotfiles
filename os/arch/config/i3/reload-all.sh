#!/bin/sh

xrdb -merge ~/.Xresources

i3-msg restart

sh $HOME/.config/i3/polybar.sh

nitrogen --restore

pkill dunst
