#!/bin/bash

set -e

xdir=$HOME/.Xresources.d

xscreen=$xdir/screen

mkdir -p $xdir

dpi=$1

if [ -z "$1" ] ; then
    dpi=96
fi

scaling=$(($dpi / 96))
cursor=$((($scaling - 1) * 64))

echo "#define DPI $dpi" > $xscreen
echo "#define SCALING $scaling" >> $xscreen
echo "#define CURSOR $cursor" >> $xscreen

echo "" >> $xscreen
echo "! vim: ft=xdefaults" >> $xscreen

cat $xscreen
