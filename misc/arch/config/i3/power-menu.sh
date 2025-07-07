#!/bin/bash

launcher='rofi -dmenu -i -p power:'
options="Logout\nSuspend\nRestart\nShutdown"

option=$(echo -e $options | $launcher | awk '{ print $1 }' | tr -d '\r\n')

if [ ${#option} -gt 0 ]; then
	case $option in
	Logout)
		i3-msg exit
		;;
	Suspend)
		systemctl suspend
		;;
	Restart)
		systemctl reboot
		;;
	Shutdown)
		systemctl poweroff
		;;
	esac
fi
