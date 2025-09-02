#!/bin/bash

WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

if [ -n "$1" ]; then
    WALLPAPER="$1"
else
    WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
fi

if [ -n "$WALLPAPER" ]; then
    wal -i "$WALLPAPER"
    ~/.config/hypr/scripts/generate_hypr_colors.sh
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    hyprctl reload
    killall waybar && waybar &
    kitty @ set-colors -a -c ~/.cache/wal/colors-kitty.conf
fi
