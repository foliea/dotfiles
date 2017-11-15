#!/bin/bash

monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

function switch_dpi() {
    local dpi=$(cat /opt/default/$1-dpi 2>/dev/null)

    if [ -z "$dpi" ]; then dpi=96 ; fi

    local scaling=$(($dpi / 96))
    local font_size=$(($scaling * 15))

    sudo sed -i -e "/font-size =/ s/= .*/= $font_size/" \
        /etc/lightdm/lightdm-mini-greeter.conf 1>/dev/null
}

if [ -z ${monitors[1]} ]; then
    xrandr --output ${monitors[0]} --auto --primary

    switch_dpi internal
else
    xrandr --output ${monitors[1]} --auto --primary --output ${monitors[0]} --off

    switch_dpi external
fi
