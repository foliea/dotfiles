#!/bin/bash

layout=`cat $HOME/.config/keyboard-layout.conf 2>/dev/null`

if [ -z "$layout" ]; then
    layout="us"
fi

setxkbmap -layout $layout -option ctrl:nocaps
