#!/bin/bash
set -e

# Using default polybar indicator when BAT0 available.
if [ $(upower -e | grep 'BAT0') ]; then
  exit 0
fi

battery_name="battery_max170xx_battery"
battery_state=$(echo "${battery_info}" | upower -i $(upower -e | grep $battery_name) | grep -E "state|to\ full" | awk '{print $2}')
battery_power=$(echo "${battery_info}" | upower -i $(upower -e | grep $battery_name) | grep -E "percentage" | awk '{print $2}' | tr -d '%')

if [[ "${battery_power}" -gt 87 ]]; then
    battery_icon=""
elif [[ "${battery_power}" -gt 63 ]]; then
    battery_icon=""
elif [[ "${battery_power}" -gt 38 ]]; then
    battery_icon=""
elif [[ "${battery_power}" -gt 13 ]]; then
    battery_icon=""
elif [[ "${battery_power}" -le 13 ]]; then
    battery_icon=""
else
    battery_icon=""
fi

if [[ "${battery_state}" = "discharging" ]]; then
    if [[ "${battery_power}" -gt 5 ]]; then
        echo "${battery_icon} ${battery_power}%"
    else
        echo "%{F#d64237}${battery_icon} ${battery_power} %%{F-}"
    fi
else
    echo " ${battery_power}%"
fi
