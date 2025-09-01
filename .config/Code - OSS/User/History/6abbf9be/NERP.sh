#!/bin/bash

# Directory containing your wallpapers
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"

# Get a random wallpaper file
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Check if a file was found
if [ -n "$RANDOM_WALLPAPER" ]; then
    # Set the new wallpaper
    hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
    hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"

    # Run pywal to generate color scheme from the new wallpaper
    wal -i "$RANDOM_WALLPAPER"

# Apply colors to Hyprland
~/.config/hypr/scripts/apply_pywal_to_hypr.sh

# Reload Hyprland to apply the new border colors
hyprctl reload

# Reload Kitty
kitty @ set-colors --all --reload ~/.cache/wal/colors-kitty.conf

# Reload waybar
killall waybar && waybar &
fi
