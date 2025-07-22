#!/bin/sh
set -e

COLOR_FILE="$HOME/.config/themes/default/wallpaper.txt"

# Read color code
COLOR=$(head -n 1 "$COLOR_FILE" | tr -d '\n' | tr -d ' ')

# Setup wallpapers folder
WALLPAPER_DIR="$HOME/.config/wallpapers"
mkdir -p "$WALLPAPER_DIR"

# Detect main display resolution
RES=$(system_profiler SPDisplaysDataType | awk '/Resolution/{print $2"x"$4; exit}')
WIDTH=$(echo "$RES" | cut -d'x' -f1)
HEIGHT=$(echo "$RES" | cut -d'x' -f2)

# Parse color (accepts only r,g,b)
if echo "$COLOR" | grep -qE '^[0-9]{1,3},[0-9]{1,3},[0-9]{1,3}$'; then
	MAGICK_COLOR="rgb($COLOR)"
else
	echo "Invalid color format in $COLOR_FILE: $COLOR" >&2
	echo "Please use an RGB color code in the format r,g,b (e.g. 0,0,0)" >&2
	exit 1
fi

IMG_PATH="$WALLPAPER_DIR/wallpaper-${COLOR}-${WIDTH}x${HEIGHT}.png"

# Generate solid color PNG only if it doesn't exist
if [ ! -f "$IMG_PATH" ]; then
	magick -size ${WIDTH}x${HEIGHT} xc:"$MAGICK_COLOR" "$IMG_PATH"
fi

# Set wallpaper using desktoppr if available, else AppleScript
if command -v desktoppr >/dev/null 2>&1; then
	desktoppr "$IMG_PATH"
fi

echo "Wallpaper set to $COLOR ($IMG_PATH)"
