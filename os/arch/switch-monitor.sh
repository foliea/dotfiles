#!/bin/bash

current_monitor_mode=`cat /tmp/monitor_mode.dat 2>/dev/null`

if [ -z "$1" ] ; then
    echo "Usage switch-monitor [mode]"
    exit 0
else
    requested_mode="$1"
fi

function keep_current_monitor_mode() {
    without_notification=true

    if [ -z "$current_monitor_mode" ] ; then
        monitor_mode="internal"
    else
        monitor_mode=$current_monitor_mode
    fi
}

function select_monitor_mode() {
    if [ $requested_mode = "greeter" ]; then
        # Writing file from display manager greeter would
        # set root as the file owner.
        greeter_mode=true

        keep_current_monitor_mode
    elif [ $requested_mode = "window" ]; then
        keep_current_monitor_mode
    elif [ $requested_mode = "cycle" ]; then
        # Cycle between internal and external
        if [ $current_monitor_mode = "internal" ]; then
            monitor_mode="external"
        else
            monitor_mode="internal"
        fi
    else
        monitor_mode=$requested_mode
    fi
}

function activate_monitor_mode() {
    monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

    internal_output=${monitors[0]}
    external_output=${monitors[1]}

    if [ $monitor_mode = "external" ]; then
        xrandr --output $internal_output --off --output $external_output --auto --primary
    elif [ $monitor_mode = "internal" ]; then
        xrandr --output $internal_output --auto --primary --output $external_output --off
    elif [ $monitor_mode = "clone" ]; then
        xrandr --output $internal_output --auto --primary --output $external_output --auto --same-as $internal_output
    elif [ $monitor_mode = "extended" ]; then
        xrandr --output $internal_output --auto --output $external_output --auto --primary --left-of $internal_output
    fi
}

function save_monitor_mode() {
    if [ -z "$greeter_mode" ] ; then
        echo "${monitor_mode}" > /tmp/monitor_mode.dat
    fi
}

function notify() {
    if [ -z "$without_notification" ] ; then
        notify-send "Switch monitor" "Selected mode: ${monitor_mode}"
    fi
}

function reload() {
    if [ -z "$greeter_mode" ] ; then
        sh $HOME/.config/polybar/launch.sh
    fi
}

select_monitor_mode
save_monitor_mode
activate_monitor_mode
notify
reload
