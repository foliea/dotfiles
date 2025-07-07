#!/bin/bash

launcher='rofi -dmenu -i -p default-dpi:'

options=""

for dpi in 96 120 144 192; do
	options="$options\ninternal: $dpi"
	options="$options\nexternal: $dpi"
done

options=${options#"\n"}

option=$(echo -e $options | $launcher)

if [ ${#option} -gt 0 ]; then
	mode=$(echo $option | cut -d ":" -f 1)

	dpi=$(echo $option | cut -d " " -f 2)

	sudo -A bash -c "echo '$dpi' > /var/default/$mode-dpi"
fi
