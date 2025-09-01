#!/bin/bash

# Path to your ASCII art file
ASCII_FILE="$HOME/.config/fastfetch/logos-ascii/ascii-art.txt"

# Check if the file exists
if [ -f "$ASCII_FILE" ]; then
    # Pipe the content of the file to fastfetch
    fastfetch --logo-source "file:$ASCII_FILE"
else
    # Fallback to the default logo if the file is not found
    fastfetch
fi