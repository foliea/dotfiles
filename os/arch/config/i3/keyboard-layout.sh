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

    $HOME/.config/i3/switch-keyboard-layout.sh $layout $flags

    notify-send --urgency=normal "Keyboard set to $option"
fi
