#!/bin/bash

set -e

xdir=$HOME/.Xresources.d

xscreen=$xdir/screen

mkdir -p $xdir

base_dpi=96

default_dpi=$(cat /opt/default/dpi)

if [ -z "$1" ] ; then
    dpi=$default_dpi
else
    dpi=$1
fi

scaling=$(($dpi / $base_dpi))
cursor=$((($scaling - 1) * 64))
top_bar_height=$((27 * $dpi / $base_dpi))

echo "#define DPI $dpi" > $xscreen
echo "#define SCALING $scaling" >> $xscreen
echo "#define CURSOR $cursor" >> $xscreen
echo "#define TOP_BAR_HEIGHT $top_bar_height" >> $xscreen

cat $xscreen
