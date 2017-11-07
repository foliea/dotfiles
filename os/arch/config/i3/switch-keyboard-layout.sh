#!/bin/bash

layout=$1
flags=$2

if [ -z "$layout" ]; then
    layout="us"
fi

setxkbmap -layout $layout $flags -option ctrl:nocaps
