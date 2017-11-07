#!/bin/bash

launcher='rofi -dmenu -i -p monitors:'

options="Clone"
options="$options\nInternal"
options="$options\nExternal"
options="$options\nExtended (Left of computer)"
options="$options\nExtended (Right of computer)"
options="$options\nExtended (Above computer)"
options="$options\nExtended (Below computer)"

option=$(echo -e $options | $launcher)

if [ ${#option} -gt 0 ]; then
    if [ "$option" == "Clone" ]; then
        /usr/local/bin/switch-monitor clone
    elif [ "$option" == "Internal" ]; then
        /usr/local/bin/switch-monitor internal
    elif [ "$option" == "External" ]; then
        /usr/local/bin/switch-monitor external
    elif [ "$option" == "Extended (Left of computer)" ]; then
        /usr/local/bin/switch-monitor extended --left-of
    elif [ "$option" == "Extended (Right of computer)" ]; then
        /usr/local/bin/switch-monitor extended --right-of
    elif [ "$option" == "Extended (Above computer)" ]; then
        /usr/local/bin/switch-monitor extended --above
    elif [ "$option" == "Extended (Below computer)" ]; then
        /usr/local/bin/switch-monitor extended --below
    fi
fi
