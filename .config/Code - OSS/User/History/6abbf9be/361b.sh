#!/bin/bash

# Directory containing your wallpapers
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers/"

# Get a random wallpaper file
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Check if a file was found
if [ -n "$RANDOM_WALLPAPER" ]; then
    # Load and set the new wallpaper
    hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
    hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"
fi

chmod +x ~/.config/hypr/scripts/random_wallpaper.sh