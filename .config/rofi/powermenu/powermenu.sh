#!/bin/bash

# Nerd Font Icons
lock=''
shutdown=''
reboot=''
logout=''

options="$lock Lock\n$shutdown Shutdown\n$reboot Reboot\n$logout Logout"

selected=$(echo -e "$options" | rofi -dmenu -p "Power" -theme "/home/harry/.config/rofi/config.rasi")

case "$(echo "$selected" | awk '{print $2}')" in
    Lock)
        hyprlock
        ;;
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
esac