#!/bin/bash

# Get colors from pywal cache
source "$HOME/.cache/wal/colors.sh"

# Hyprland config file
HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"

# New border colors using pywal variables (e.g., color4 for active, color0 for inactive)
# The hex codes are already in $colorX variables from colors.sh
ACTIVE_BORDER="$color4"
INACTIVE_BORDER="$color0"
BG_COLOR="$color0"

# Convert to rgba format
# The `aa` is for opacity (255 in hex)
ACTIVE_BORDER_RGBA="rgba(${ACTIVE_BORDER:1}ff)"
INACTIVE_BORDER_RGBA="rgba(${INACTIVE_BORDER:1}ee)"
BG_COLOR_RGBA="rgba(${BG_COLOR:1}aa)"

# Use sed to replace the placeholder variables in the Hyprland config
# Use a unique delimiter like `|` to avoid issues with slashes
sed -i "s|^\\(\$border_active_color\\s*=\\s*\\).*|\\1$ACTIVE_BORDER_RGBA|" "$HYPR_CONFIG"
sed -i "s|^\\(\$border_inactive_color\\s*=\\s*\\).*|\\1$INACTIVE_BORDER_RGBA|" "$HYPR_CONFIG"

# To set the blur effect color and border color, you can use similar logic.
# The blur effect itself doesn't have a color property. It blurs the content behind it.
# The `shadow` color can be set to the background color.
sed -i "s|^\\(color\\s*=\\s*\\).*|\\1$BG_COLOR_RGBA|" "$HYPR_CONFIG"
