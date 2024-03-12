#!/bin/bash

case "$1" in
    --increase)
        pamixer --increase 5
        ;;
    --decrease)
        pamixer --decrease 5
        ;;
    *)
        ;;
esac

# Get the current volume
VOLUME=$(pamixer --get-volume)

# Check if muted
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    echo "󰝟 Mute"
else
    echo " $VOLUME%"
fi
