#!/bin/bash

# Source the Pywal colors
source "$HOME/.cache/wal/colors.sh"

# Define the output file
HYPR_COLORS_FILE="$HOME/.cache/wal/colors-hyprland.conf"

# Remove the '#' from the beginning of the hex codes and add 'ff' for opacity
printf "
# Colors from Pywal
\$background = rgba(%sff)
\$foreground = rgba(%sff)
\$color0 = rgba(%sff)
\$color1 = rgba(%sff)
\$color2 = rgba(%sff)
\$color3 = rgba(%sff)
\$color4 = rgba(%sff)
\$color5 = rgba(%sff)
\$color6 = rgba(%sff)
\$color7 = rgba(%sff)
\$color8 = rgba(%sff)
\$color9 = rgba(%sff)
\$color10 = rgba(%sff)
\$color11 = rgba(%sff)
\$color12 = rgba(%sff)
\$color13 = rgba(%sff)
\$color14 = rgba(%sff)
\$color15 = rgba(%sff)
" \
"${background:1}" "${foreground:1}" "${color0:1}" "${color1:1}" "${color2:1}" "${color3:1}" "${color4:1}" "${color5:1}" "${color6:1}" "${color7:1}" "${color8:1}" "${color9:1}" "${color10:1}" "${color11:1}" "${color12:1}" "${color13:1}" "${color14:1}" "${color15:1}" > "$HYPR_COLORS_FILE"