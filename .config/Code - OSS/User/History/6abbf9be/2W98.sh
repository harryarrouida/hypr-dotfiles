#!/bin/bash

# Get a random wallpaper file
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Check if a file was found
if [ -n "$RANDOM_WALLPAPER" ]; then
    # Set the new wallpaper
    hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
    hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"

    # Run pywal to generate color scheme
    wal -i "$RANDOM_WALLPAPER"

    # Source pywal's color file
    source "$HOME/.cache/wal/colors.sh"

    # Apply colors to Hyprland borders
    HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"
    sed -i "s|col.active_border = rgba(.\{8\})|col.active_border = ${color4}ff|" "$HYPR_CONFIG"
    sed -i "s|col.inactive_border = rgba(.\{8\})|col.inactive_border = ${color0}ee|" "$HYPR_CONFIG"
    
    # Apply colors to Hyprlock
    ~/.config/hypr/scripts/apply_hyprlock_colors.sh

    # Reload Hyprland, waybar, kitty
    hyprctl reload
    killall waybar && waybar &
    kitty @ set-colors -a -c ~/.cache/wal/colors-kitty.conf
fi