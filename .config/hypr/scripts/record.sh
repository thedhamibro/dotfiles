#!/usr/bin/env bash

DIR="$HOME/Videos/Recordings"
mkdir -p "$DIR"
FILE="$DIR/recording_$(date +'%Y%m%d_%H%M%S').mp4"

notify() {
    notify-send -t 3000 "Recording Mode" "$1"
}

# Always reset the hyprland submap to default when a command is fired
hyprctl dispatch 'hl.dsp.submap("reset")'

# Stop recording if running
if pidof gpu-screen-recorder > /dev/null; then
    killall -s SIGINT gpu-screen-recorder
    notify "Recording saved to $DIR"
    exit 0
fi

case "$1" in
    region)
        # Use slurp to get region
        GEOMETRY=$(slurp -f "%wx%h+%x+%y")
        if [ -z "$GEOMETRY" ]; then
            exit 1
        fi
        notify "Recording region started..."
        gpu-screen-recorder -w "$GEOMETRY" -f 60 -a default_output -o "$FILE"
        ;;
    fullscreen)
        # Get focused monitor name from hyprctl
        MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
        if [ -z "$MONITOR" ] || [ "$MONITOR" = "null" ]; then
            MONITOR="screen" # fallback to portal
        fi
        notify "Recording fullscreen ($MONITOR) started..."
        gpu-screen-recorder -w "$MONITOR" -f 60 -a default_output -o "$FILE"
        ;;
    stop)
        # Process is already handled above
        ;;
    *)
        echo "Usage: $0 {region|fullscreen|stop}"
        exit 1
        ;;
esac
