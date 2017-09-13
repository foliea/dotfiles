#!/bin/sh
set -e

Xephyr -ac -br -noreset -screen 1600x900 :1.0 &
ZEPHYR_PID=$!
sleep 1
PREVIEW=true DISPLAY=:1.0 i3
