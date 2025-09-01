#!/bin/bash

# Define the options
options="lock\nlogout\nsuspend\nreboot\nshutdown"

# Launch Rofi with the options
chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -theme-str 'listview {columns: 5; }')

case "$chosen" in
    "lock")
        hyprlock &;;
    "logout")
        hyprctl dispatch exit;;
    "suspend")
        systemctl suspend;;
    "reboot")
        systemctl reboot;;
    "shutdown")
        systemctl poweroff;;
esac
