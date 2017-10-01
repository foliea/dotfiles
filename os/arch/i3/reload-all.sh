#!/bin/sh

xrdb -merge ~/.Xresources

i3-msg restart

sh $HOME/.config/polybar/launch.sh

nitrogen --restore
