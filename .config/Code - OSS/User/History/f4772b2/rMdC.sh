#!/bin/bash

# Source the Pywal colors
source "$HOME/.cache/wal/colors.sh"

# Define the output file
HYPR_COLORS_FILE="$HOME/.cache/wal/colors-hyprland.conf"

# Write the colors to the file
printf "
# Colors from Pywal
\$background = %s
\$foreground = %s
\$color0 = %s
\$color1 = %s
\$color2 = %s
\$color3 = %s
\$color4 = %s
\$color5 = %s
\$color6 = %s
\$color7 = %s
\$color8 = %s
\$color9 = %s
\$color10 = %s
\$color11 = %s
\$color12 = %s
\$color13 = %s
\$color14 = %s
\$color15 = %s
" \
"$background" "$foreground" "$color0" "$color1" "$color2" "$color3" "$color4" "$color5" "$color6" "$color7" "$color8" "$color9" "$color10" "$color11" "$color12" "$color13" "$color14" "$color15" > "$HYPR_COLORS_FILE"