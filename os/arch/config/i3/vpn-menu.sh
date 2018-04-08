#!/bin/bash

launcher='rofi -dmenu -i -p vpn:'

modes=($(ls -I *.txt /etc/openvpn/client | cut -d '.' -f 1 | tr ' ', '\n'))

options="Disconnect"

for mode in "${modes[@]}"
do
    options="$options\n$mode"
done

options=${options#"\n"}

option=$(echo -e ${options} | $launcher)

if [ ${#option} -gt 0 ]; then
    if [ "$option" == "Disconnect" ]; then
        sudo -A vpn-control stop
    else
        sudo -A vpn-control start $option
    fi
fi
