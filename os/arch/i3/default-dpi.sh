#!/bin/bash

launcher='rofi -dmenu -i -p default-dpi:'

options=""

for dpi in 96 192 220 ; do
    options="$options\ninternal: $dpi"
    options="$options\nexternal: $dpi"
done

options=${options#"\n"}

option=$(echo -e $options | $launcher)

if [ ${#option} -gt 0 ]; then
    mode=$(echo $option | cut -d ":" -f 1)

    dpi=$(echo $option | cut -d " " -f 2)

    zenity --password | sudo bash -c "echo '$dpi' > /opt/default/$mode-dpi"
fi
