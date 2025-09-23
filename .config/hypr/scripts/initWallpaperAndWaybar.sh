#!/usr/bin/env bash

# ------------------------------
# CONFIG
# ------------------------------
WALLPAPER_DIR="$HOME/Wallpapers"
WAYBAR_CONFIG="$HOME/.config/waybar/config.json"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
WAYBAR_COLORS="$HOME/.config/waybar/colors-waybar.css"

# ------------------------------
# EXPORT PATH
# ------------------------------
export PATH="$PATH:$HOME/.local/bin"

# ------------------------------
# START WALLPAPER DAEMON
# ------------------------------
# Only start swww if not running
if ! pgrep -x swww-daemon >/dev/null; then
    swww-daemon &
fi

# ------------------------------
# PICK WALLPAPER
# ------------------------------
if [ -e "$HOME/.cache/wal/colors" ]; then
    # Reload existing Pywal colors
    wal -R --cols16
    echo "Cached colors exist. Using existing colors."
else
    # Pick random wallpaper
    PICS=("$WALLPAPER_DIR"/*)
    RANDOM_PIC="${PICS[RANDOM % ${#PICS[@]}]}"

    # Set wallpaper
    swww img "$RANDOM_PIC" \
        --transition-type grow \
        --transition-fps 60 \
        --transition-duration 1.0 \
        --transition-pos 0.810,0.972 \
        --transition-bezier 0.65,0,0.35,1 \
        --transition-step 255

    # Generate Pywal colors
    wal -i "$RANDOM_PIC" --cols16
    echo "Wallpaper set and colors generated from it."
fi

# ------------------------------
# UPDATE OTHER PYWAL INTEGRATIONS
# ------------------------------
pywalfox update
pywal-discord -t default

. "$HOME/.config/mako/update-colors.sh"
. "$HOME/.config/spicetify/Themes/Pywal/update-colors.sh"
#. $HOME/.config/cava/scripts/update-colors.sh

# ------------------------------
# CONVERT PYWAL COLORS FOR WAYBAR
# ------------------------------
if [ -f "$HOME/.cache/wal/colors-waybar.css" ]; then
    cp "$HOME/.cache/wal/colors-waybar.css" "$WAYBAR_COLORS"

    # Convert GTK @define-color -> SCSS @variable syntax
    sed -i \
        -e 's/@define-color /@/' \
        -e 's/ /: /' \
        -e 's/;$//' \
        "$WAYBAR_COLORS"
fi

# ------------------------------
# RELOAD WAYBAR
# ------------------------------
pkill -f waybar

WAYBAR_STYLE_PATH="$WAYBAR_STYLE" \
WAYBAR_COLORS_PATH="$WAYBAR_COLORS" \
waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE" &

echo "Waybar reloaded with new Pywal colors."

