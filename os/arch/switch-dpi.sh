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

echo "#define DPI $dpi" > $xscreen
echo "#define CURSOR $cursor" >> $xscreen

cat $xscreen
