#!/bin/sh
set -e

xflux_pid=$(ps -aux | rg "xflux" | awk '( $11 == "xflux"){ print $2 }')

if [ $xflux_pid != "" ]; then
    kill $xflux_pid
else
    xflux -r 1 -l 48.86 -g 2.34 -nofork &
fi
