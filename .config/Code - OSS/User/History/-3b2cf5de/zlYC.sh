#!/bin/bash

# Source pywal's color file
source "$HOME/.cache/wal/colors.sh"

# Hyprlock template and final config file
HYPRLOCK_TEMPLATE="$HOME/.config/hypr/hyprlock.conf.template"
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"

# Copy the template to the final config file
cp "$HYPRLOCK_TEMPLATE" "$HYPRLOCK_CONFIG"

# Replace the placeholders in the final config file
sed -i "s|REPLACE_WITH_COLOR0|$color0|" "$HYPRLOCK_CONFIG"
sed -i "s|REPLACE_WITH_COLOR1|$color1|" "$HYPRLOCK_CONFIG"
sed -i "s|REPLACE_WITH_COLOR4|$color4|" "$HYPRLOCK_CONFIG"
sed -i "s|REPLACE_WITH_FOREGROUND|$foreground|" "$HYPRLOCK_CONFIG"