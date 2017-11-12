#!/bin/bash

function activate_mode() {
    local mode="$1"
    local position="$2"
    local internal_output=$(monitors-information internal)
    local external_output=$(monitors-information external)

    local multiple_monitors_flags="--mode 1920x1080"

    case $mode in
        external)
            if [ -z "$external_output" ]; then
                exit 1
            fi
            xrandr \
                --output $internal_output --off \
                --output $external_output --auto --primary
            ;;
        internal)
            xrandr \
                --output $internal_output --auto --primary \
                --output $external_output --off
            ;;
        clone)
            xrandr \
                --output $internal_output $multiple_monitors_flags --primary \
                --output $external_output $multiple_monitors_flags --same-as $internal_output
            ;;
        extended)
            xrandr \
                --output $internal_output $multiple_monitors_flags \
                --output $external_output --auto $position $internal_output
            ;;
    esac
}

function cycle() {
    local current_mode=$(monitors-information current_mode)
    local mode="internal"

    if [ $current_mode = "internal" ]; then
        mode="external"
    fi

    activate_mode $mode

    save_configuration $mode
}

function save_configuration {
    echo $1 > /tmp/monitor_mode.dat
    echo $2 > /tmp/monitor_position.dat
}

requested_action="$1"
requested_position="$2"

if [ $requested_action = "cycle" ]; then
    cycle
else
    activate_mode $requested_action $requested_position

    save_configuration $requested_action $requested_position
fi

sh $HOME/.config/i3/reload-all.sh
