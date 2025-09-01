#!/bin/bash

ASCII_LOGO="$HOME/.config/fastfetch/logos-ascii/ascii-art.txt"

# Check if the ASCII file exists
if [ -f "$ASCII_LOGO" ]; then
    # Use the --logo-source flag to load the ASCII art
    fastfetch --logo-source "file:$ASCII_LOGO"
else
    # Fallback to a minimal config if the file is not found
    fastfetch --config ~/.config/fastfetch/small.jsonc
fi