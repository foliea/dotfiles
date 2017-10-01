#!/bin/bash

if [ -z $PREVIEW ]; then
    killall -q polybar

    while pgrep -x polybar >/dev/null; do sleep 1; done
fi

dpi=$(cat ~/.Xresources.d/screen | awk '($2 == "DPI") { print $3 }')

base_dpi=96

top_bar_height=$((27 * $dpi / $base_dpi))

DPI=$dpi TOP_BAR_HEIGHT=$top_bar_height polybar top &
