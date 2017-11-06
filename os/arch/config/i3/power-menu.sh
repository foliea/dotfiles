#!/bin/bash

launcher='rofi -dmenu -i -p power:'
options="Logout\nSuspend\nRestart\nShutdown"

option=$(echo -e $options | $launcher | awk '{ print $1 }' | tr -d '\r\n')

restore_dpi() {
    /usr/local/bin/switch-dpi internal
}

if [ ${#option} -gt 0 ]; then
    case $option in
        Logout)
            i3-msg exit
            ;;
        Suspend)
            systemctl suspend
            ;;
        Restart)
            restore_dpi

            systemctl reboot
            ;;
        Shutdown)
            restore_dpi

            systemctl poweroff
            ;;
    esac
fi
