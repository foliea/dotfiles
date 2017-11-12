#!/bin/bash

monitors=($(xrandr | awk '( $2 == "connected" ){ print $1 }'))

function internal() {
    echo ${monitors[0]}
}

function external() {
    echo ${monitors[1]}
}

function current_mode() {
    local current_mode=`cat /tmp/monitor_mode.dat 2>/dev/null`

    if [ -z "$current_mode" ] ; then
        if [ -z ${monitors[1]} ]; then
            current_mode="internal"
        else
            current_mode="external"
        fi
    fi

    echo $current_mode
}

function current_position() {
    cat /tmp/monitor_position.dat 2>/dev/null
}

function dpi() {
    local mode=$(current_mode)
    local config="internal"

    if [ "$mode" != "internal" ]; then
        config="external"
    fi

    cat /opt/default/$config-dpi 2>/dev/null
}

if [ -z "$1" ]; then
    echo "Internal: $(internal)"
    echo "External: $(external)"
    echo "Current Mode: $(current_mode)"
    echo "Position: $(current_position)"
    echo "DPI: $(dpi)"
else
    echo $($1)
fi
