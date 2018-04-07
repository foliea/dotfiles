#!/bin/bash

launcher='rofi -dmenu -i -p vpn:'

modes=($(ls -I *.txt -I contrib -I examples /usr/share/openvpn | tr ' ', '\n'))

options="Disconnect"

for mode in "${modes[@]}"
do
    options="$options\n$mode"
done

options=${options#"\n"}

option=$(echo -e ${options} | $launcher)

if [ ${#option} -gt 0 ]; then
    sudo -A

    sudo -A pkill openvpn

    if [ "$option" != "Disconnect" ]; then
        sudo -A openvpn --script-security 2 --config /usr/share/openvpn/$option/$option.conf &
    fi
fi
