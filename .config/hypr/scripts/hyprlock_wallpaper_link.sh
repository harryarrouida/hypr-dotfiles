#!/bin/sh

# Your existing script to get a random wallpaper and set it with hyprpaper
# ...
WALLPAPER_PATH=$(cat ~/.cache/wal/wal)

# Create a symlink to the current wallpaper
ln -sf "$WALLPAPER_PATH" "$HOME/Pictures/current_wallpaper"

