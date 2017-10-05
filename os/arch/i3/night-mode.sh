#!/bin/sh

if [ -z $(ps -aux | grep "redshift" | awk '( $11 == "redshift") { print $2 }') ]; then
    redshift randr -v &
else
    pkill redshift
fi
