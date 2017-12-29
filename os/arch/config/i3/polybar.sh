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

theme=$(cat ~/.Xresources.d/theme 2>/dev/null | awk '{ print $2"="$3 }')

export $theme
export DPI=$dpi
export TOP_BAR_HEIGHT=$((27 * $dpi / $base_dpi))

if type "xrandr"; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$monitor polybar top &
  done
else
  polybar top &
fi
