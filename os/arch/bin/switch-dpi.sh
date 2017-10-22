#!/bin/bash

function use() {
    local xscreen=$HOME/.Xresources.d/screen

    local base_dpi=96

    local dpi="$1"

    if [ -z "$dpi" ]; then
        dpi=$base_dpi
    fi

    local scaling=$(($dpi / $base_dpi))

    local cursor=$((($scaling - 1) * 64))

    echo "#define DPI $dpi" > $xscreen
    echo "#define CURSOR $cursor" >> $xscreen

    cat $xscreen
}

default_dpi=$(cat /opt/default/$1-dpi 2>/dev/null)

use $default_dpi
