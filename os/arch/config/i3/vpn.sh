#!/bin/bash

launcher='rofi -dmenu -i -p vpn:'

modes=($(ls /usr/share/openvpn | tr ' ', '\n'))

options="stop"

for mode in "${modes[@]}"
do
    if [[ "$mode" != "contrib" && "$mode" != "examples" ]]; then
        options="$options\n$mode"
    fi
done

options=${options#"\n"}

option=$(echo -e ${options} | $launcher)

if [ ${#option} -gt 0 ]; then
    sudo -A pkill openvpn

    if [ "$option" != "stop" ]; then
        sudo -A openvpn --script-security 2 --config /usr/share/openvpn/$option/$option.conf &
    fi
fi
