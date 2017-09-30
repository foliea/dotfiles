#!/bin/bash

set -e

xdir=$HOME/.Xresources.d

xscreen=$xdir/screen

mkdir -p $xdir

dpi=$1

default_dpi=96

if [ -z "$1" ] ; then
    dpi=$default_dpi
fi

scaling=$(($dpi / $default_dpi))
cursor=$((($scaling - 1) * 64))
top_bar_height=$((27 * $dpi / $default_dpi))

echo "#define DPI $dpi" > $xscreen
echo "#define SCALING $scaling" >> $xscreen
echo "#define CURSOR $cursor" >> $xscreen
echo "#define TOP_BAR_HEIGHT $top_bar_height" >> $xscreen

echo "" >> $xscreen
echo "! vim: ft=xdefaults" >> $xscreen

cat $xscreen
