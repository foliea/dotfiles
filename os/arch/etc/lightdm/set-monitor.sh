#!/bin/bash

monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

if [ -z ${monitors[1]} ]; then
    xrandr --output ${monitors[0]} --auto --primary
else
    xrandr --output ${monitors[1]} --auto --primary --output ${monitors[0]} --off
fi
