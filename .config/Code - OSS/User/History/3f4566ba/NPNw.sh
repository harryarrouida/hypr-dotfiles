#!/bin/bash

# Check the terminal width
if [ "$COLUMNS" -gt 100 ]; then
    # Run fastfetch with the large config
    fastfetch --config ~/.config/fastfetch/large.jsonc
else
    # Run fastfetch with the small config
    fastfetch --config ~/.config/fastfetch/small.jsonc
fi