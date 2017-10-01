#!/bin/sh

xrdb -merge ~/.Xresources

i3-msg reload

sh $HOME/.config/polybar/launch.sh

nitrogen --restore
