#!/bin/bash
set -e

layout=`cat $HOME/.config/keyboard-layout.conf 2>/dev/null`

if [ -z "$layout" ]; then
    layout="us"
fi

setxkbmap -layout $layout

xmodmap $HOME/.Xmodmap
