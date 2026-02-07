#!/bin/bash
WALLDIR="$HOME/Pictures/Wallpapers"
while inotifywait -e close_write,create,delete,move "$WALLDIR"; do
    wal -i "$WALLDIR"
done
