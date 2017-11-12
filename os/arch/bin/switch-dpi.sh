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

use $(monitors-information dpi)
