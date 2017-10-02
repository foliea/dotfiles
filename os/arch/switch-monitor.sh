#!/bin/bash

function switch_dpi() {
    if [ "$requested_mode" != "greeter" ]; then
        /usr/local/bin/switch-dpi $1
    fi
}

function activate_monitor_mode() {
    local monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

    local internal_output=${monitors[0]}
    local external_output=${monitors[1]}

    local base_dpi=96
    local multiple_monitors_flags="--mode 1920x1080"

    if [ $monitor_mode = "external" ]; then
        switch-dpi $base_dpi

        xrandr \
            --output $internal_output --off \
            --output $external_output --auto --primary
    elif [ $monitor_mode = "internal" ]; then
        switch_dpi

        xrandr \
            --output $internal_output --auto --primary \
            --output $external_output --off
    elif [ $monitor_mode = "clone" ]; then
        switch-dpi $base_dpi

        xrandr \
            --output $internal_output $multiple_monitors_flags --primary \
            --output $external_output $multiple_monitors_flags --same-as $internal_output
    elif [ $monitor_mode = "extended" ]; then
        switch-dpi $base_dpi

        xrandr \
            --output $internal_output $multiple_monitors_flags \
            --output $external_output --auto --left-of $internal_output
    fi
}

function save_monitor_mode() {
    # Writing file from display manager greeter would
    # set root as the file owner.
    if [ "$requested_mode" != "greeter" ]; then
        echo "${monitor_mode}" > /tmp/monitor_mode.dat
    fi
}

function notify() {
    if [ "$requested_mode" != "greeter" ]; then
        notify-send "Switch monitor" "Selected mode: ${monitor_mode}"
    fi
}

function reload() {
    if [ "$requested_mode" != "greeter" ]; then
        sh $HOME/.config/i3/reload-all.sh
    fi
}

current_monitor_mode=`cat /tmp/monitor_mode.dat 2>/dev/null`

if [ -z "$1" ] ; then
    echo "Usage switch-monitor [mode]"
    exit 0
else
    requested_mode="$1"
fi

if [ -z "$current_monitor_mode" ] ; then
    current_monitor_mode="internal"
fi

if [ $requested_mode = "greeter" ]; then
    monitor_mode=$current_monitor_mode
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

save_monitor_mode
activate_monitor_mode
reload
notify
