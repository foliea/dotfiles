#!/bin/bash

launcher='rofi -dmenu -i -p keyboard:'
options="Qwerty\nAzerty"

option=$(echo -e $options | $launcher | awk '{ print $1 }' | tr -d '\r\n')

if [ ${#option} -gt 0 ]; then
    case $option in
        Qwerty)
          layout=us
          ;;
        Azerty)
          layout=fr
          ;;
    esac

    if [[ $(setxkbmap -layout "$layout") ]]; then
        notify-send --urgency=failure "Could not load layout $option"
    else
        notify-send --urgency=normal "Keyboard set to $option"
    fi

    setxkbmap -layout us -option ctrl:nocaps
fi
