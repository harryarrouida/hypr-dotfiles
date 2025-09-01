#!/bin/bash

# Directory containing your wallpapers
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

# Get a random wallpaper file
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Check if a file was found
if [ -n "$RANDOM_WALLPAPER" ]; then
    # Generate Pywal colors for Hyprland and other applications
    wal -i "$RANDOM_WALLPAPER"

    # Generate the Hyprland specific color file
    ~/.config/hypr/scripts/generate_hypr_colors.sh

    # Set the new wallpaper
    hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
    hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"
    
    # Reload Hyprland and other apps
    hyprctl reload
    killall waybar && waybar &
    kitty @ set-colors -a -c ~/.cache/wal/colors-kitty.conf
fi