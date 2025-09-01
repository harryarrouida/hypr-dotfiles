#!/bin/bash

# Get colors from pywal cache
source "$HOME/.cache/wal/colors.sh"

# Hyprland config file
HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Format colors for Hyprland
ACTIVE_BORDER_RGBA="rgba(${color4:1}ff)"
INACTIVE_BORDER_RGBA="rgba(${color0:1}ee)"
BG_COLOR_RGBA="rgba(${color0:1}aa)"

# Use sed to replace the placeholder variables
sed -i "s|^\\(\\$border_active_color\\s*=\\s*\\).*|\\1$ACTIVE_BORDER_RGBA|" "$HYPR_CONFIG"
sed -i "s|^\\(\\$border_inactive_color\\s*=\\s*\\).*|\\1$INACTIVE_BORDER_RGBA|" "$HYPR_CONFIG"
