#!/bin/bash

launcher='rofi -dmenu -i -p keyboard:'
options="Qwerty\nQwerty International\nAzerty"

option=$(echo -e $options | $launcher)

if [ ${#option} -gt 0 ]; then
    if [ "$option" == "Qwerty" ]; then
        layout=us
    elif [ "$option" == "Qwerty International" ]; then
        layout=us
        flags="-variant altgr-intl -option nodeadkeys"
    elif [ "$option" == "Azerty" ]; then
        layout=fr
    fi

    setxkbmap -layout $layout $flags -option ctrl:nocaps

    notify-send --urgency=normal "Keyboard set to $option"
fi
