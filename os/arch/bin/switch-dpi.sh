#!/bin/bash

function use() {
    local xscreen=$HOME/.Xresources.d/screen

    local dpi="$1"

    local scaling=$(($dpi / 96))

    local cursor=$((($scaling - 1) * 64))

    echo "#define DPI $dpi" > $xscreen
    echo "#define CURSOR $cursor" >> $xscreen

    cat $xscreen
}

default_dpi=$(cat /opt/default/$1-dpi 2>/dev/null)

[ ! -z "$default_dpi" ] && use $default_dpi
