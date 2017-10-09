#!/bin/bash

if [ -z $PREVIEW ]; then
    killall -q polybar

    while pgrep -x polybar >/dev/null; do sleep 1; done
fi

base_dpi=96

dpi=$(cat ~/.Xresources.d/screen 2>/dev/null | awk '($2 == "DPI") { print $3 }')

if [ -z "$dpi" ]; then
    dpi=$base_dpi
fi

top_bar_height=$((27 * $dpi / $base_dpi))

DPI=$dpi TOP_BAR_HEIGHT=$top_bar_height polybar top &
