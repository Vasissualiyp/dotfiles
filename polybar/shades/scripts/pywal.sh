#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/shades/colors.ini"
RFILE="$HOME/.config/polybar/shades/scripts/rofi/colors.rasi"
WFILE="$HOME/.cache/wal/colors.sh"

# Get colors
pywal_get() {
	wal -i "$1" -q -t
}

# Adjust colors with Python
adjust_colors() {
	python3 - <<END
import os
from colorsys import rgb_to_hsv, hsv_to_rgb

def hex_to_rgb(hex_color):
    return int(hex_color[1:3], 16) / 255.0, int(hex_color[3:5], 16) / 255.0, int(hex_color[5:7], 16) / 255.0

def rgb_to_hex(rgb_color):
    return "#{:02x}{:02x}{:02x}".format(int(rgb_color[0] * 255), int(rgb_color[1] * 255), int(rgb_color[2] * 255))

def hsv_to_hsl(h, s, v):
    l = (2 - s) * v / 2
    if l != 0:
        if l == 1:
            s = 0
        elif l < 0.5:
            s = s * v / (l * 2)
        else:
            s = s * v / (2 - l * 2)
    return h, s, l

def hsl_to_hsv(h, s, l):
    if l <= 0.5:
        v = l * (1 + s)
    else:
        v = (l + s) - (s * l)
    if v < 1e-10:
        return h, 0, v
    s = 2 - 2 * l / v
    return h, s, v

def adjust_hsl(h, s, l):
    h = (h + 0.07) % 1.0
    s = min(s + 0.1, 1.0)
    return h, s, l

# Get pywal colors
colors = []
with open("$WFILE", "r") as file:
    lines = file.readlines()
    for line in lines:
        if line.startswith("color"):
            colors.append(line.split('"')[1])

# Adjust colors
adjusted_colors = []
for hex_color in colors:
    rgb = hex_to_rgb(hex_color)
    h, s, v = rgb_to_hsv(*rgb)
    h, s, l = hsv_to_hsl(h, s, v)
    h, s, l = adjust_hsl(h, s, l)
    h, s, v = hsl_to_hsv(h, s, l)
    adjusted_rgb = hsv_to_rgb(h, s, v)
    adjusted_hex = rgb_to_hex(adjusted_rgb)
    adjusted_colors.append(adjusted_hex)

# Update pywal color file with adjusted colors
with open("$WFILE", "w") as file:
    file.write(f'background="{adjusted_colors[0]}"\n')
    file.write(f'foreground="{adjusted_colors[7]}"\n')
    for i, color in enumerate(adjusted_colors[1:8]):
        file.write(f'color{i}="{color}"\n')
END
}
# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE

	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  bg1:   ${SH1}FF;
	  bg2:   ${SH2}FF;
	  bg3:   ${SH3}FF;
	  bg4:   ${SH4}FF;
	  bg5:   ${SH5}FF;
	  bg6:   ${SH6}FF;
	  bg7:   ${SH7}FF;
	  bg8:   ${SH8}FF;
	  fg:    ${FG}FF;
	}
	EOF

	polybar-msg cmd restart
	nitrogen --restore
}

