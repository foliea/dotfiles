#!/bin/bash

monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

internal_output=${monitors[0]}
external_output=${monitors[1]}

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
    monitor_mode="all"
# otherwise read the value from the file
else
    monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "all" ]; then
    monitor_mode="external"
    xrandr --output $internal_output --off --output $external_output --auto
elif [ $monitor_mode = "external" ]; then
    monitor_mode="internal"
    xrandr --output $internal_output --auto --primary --output $external_output --off
else
    monitor_mode="all"
    xrandr --output $internal_output --auto --output $external_output --auto --left-of $internal_output
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat

notify-send "Switch monitor" "Selected mode: ${monitor_mode}"

sh $HOME/.config/polybar/launch.sh
