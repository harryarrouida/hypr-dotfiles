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
    
    # Remove the '#' from the beginning of the hex codes
    ACTIVE_BORDER=${color4:1}
    INACTIVE_BORDER=${color0:1}
    
    # Format the colors for Hyprland (rgba(RRGGBBAA))
    ACTIVE_BORDER_RGBA="rgba(${ACTIVE_BORDER}ff)"
    INACTIVE_BORDER_RGBA="rgba(${INACTIVE_BORDER}ee)"

    # Apply colors to Hyprland borders
    HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"
    sed -i "s|col.active_border = rgba(.\{8\})|col.active_border = ${ACTIVE_BORDER_RGBA}|" "$HYPR_CONFIG"
    sed -i "s|col.inactive_border = rgba(.\{8\})|col.inactive_border = ${INACTIVE_BORDER_RGBA}|" "$HYPR_CONFIG"

    # Apply colors to Hyprlock
    ~/.config/hypr/scripts/apply_hyprlock_colors.sh

    # Reload Hyprland and other apps
    hyprctl reload
    killall waybar && waybar &
    kitty @ set-colors -a -c ~/.cache/wal/colors-kitty.conf
fi