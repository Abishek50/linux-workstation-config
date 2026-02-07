#!/usr/bin/env bash
# Ensure the script has access to the correct display/session for clipboard use
export DISPLAY=${DISPLAY:-:0}
export XAUTHORITY=${XAUTHORITY:-$HOME/.Xauthority}

# If no arguments are passed, exit quietly
[ $# -eq 0 ] && exit 0

# Convert each argument (path) into a new line
paths=""
for arg in "$@"; do
    # Remove potential 'file://' prefix and append newline
    clean_path=$(echo "$arg" | sed 's#^file://##')
    paths+="$clean_path"$'\n'
done

# Copy to clipboard
printf "%s" "$paths" | xclip -selection clipboard

# Optional notification
notify-send "Copied paths to clipboard" "$(printf "%s" "$paths")"

