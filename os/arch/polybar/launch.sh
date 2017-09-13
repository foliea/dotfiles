#!/bin/sh

if [ -z $PREVIEW ]; then
    killall -q polybar

    while pgrep -x polybar >/dev/null; do sleep 1; done
fi

polybar top &
