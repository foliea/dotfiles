#!/bin/bash

launcher='rofi -dmenu -i -p monitors:'

options="Clone"
options="$options\nInternal"
options="$options\nExternal"
options="$options\nExtended (Left of computer)"
options="$options\nExtended (Right of computer)"
options="$options\nExtended (Above computer)"
options="$options\nExtended (Below computer)"

option=$(echo -e $options | $launcher)

cmd=switch-monitor

if [ ${#option} -gt 0 ]; then
	if [ "$option" == "Clone" ]; then
		$cmd clone
	elif [ "$option" == "Internal" ]; then
		$cmd internal
	elif [ "$option" == "External" ]; then
		$cmd external
	elif [ "$option" == "Extended (Left of computer)" ]; then
		$cmd extended --left-of
	elif [ "$option" == "Extended (Right of computer)" ]; then
		$cmd extended --right-of
	elif [ "$option" == "Extended (Above computer)" ]; then
		$cmd extended --above
	elif [ "$option" == "Extended (Below computer)" ]; then
		$cmd extended --below
	fi
fi
