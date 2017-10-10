#!/bin/bash

base_dpi=96

dpi=$(cat ~/.Xresources.d/screen 2>/dev/null | awk '($2 == "DPI") { print $3 }')

if [ -z "$dpi" ]; then
    dpi=$base_dpi
fi

scaling=$(($dpi / $base_dpi))

eval "QT_AUTO_SCREEN_SCALE_FACTOR=0 QT_SCREEN_SCALE_FACTORS=$scaling $@"
