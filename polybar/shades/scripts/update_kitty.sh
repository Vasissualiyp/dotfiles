#!/bin/bash

# Path to the colors.ini and kitty.conf files
colors_file="$HOME/.config/polybar/shades/colors.ini"
kitty_conf="$HOME/.config/kitty/kitty.conf"

# Extract colors from colors.ini
background=$(grep "^background" $colors_file | cut -d '=' -f2 | tr -d ' ')
foreground=$(grep "^foreground" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade1=$(grep "^shade1" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade2=$(grep "^shade2" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade3=$(grep "^shade3" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade4=$(grep "^shade4" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade5=$(grep "^shade5" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade6=$(grep "^shade6" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade7=$(grep "^shade7" $colors_file | cut -d '=' -f2 | tr -d ' ')
shade8=$(grep "^shade8" $colors_file | cut -d '=' -f2 | tr -d ' ')

# Function to update or append the configuration
update_or_append() {
    grep -q "$1 " $kitty_conf && \
        sed -i "s/^$1.*/$1 $2/" $kitty_conf || \
        echo "$1 $2" >> $kitty_conf
}

# Update colors in kitty.conf
update_or_append "background " $background
#update_or_append "foreground" $foreground
#update_or_append "color0" $shade1
#update_or_append "color1" $shade2
#update_or_append "color2" $shade3
update_or_append "active_tab_background" $shade4
#update_or_append "color4" $shade5
#update_or_append "color5" $shade6
#update_or_append "color6" $shade7
#update_or_append "color7" $shade8
#update_or_append "color8" $(echo $shade1 | sed 's/#//')
#update_or_append "color9" $(echo $shade2 | sed 's/#//')
#update_or_append "color10" $(echo $shade3 | sed 's/#//')
#update_or_append "color11" $(echo $shade4 | sed 's/#//')
#update_or_append "color12" $(echo $shade5 | sed 's/#//')
#update_or_append "color13" $(echo $shade6 | sed 's/#//')
#update_or_append "color14" $(echo $shade7 | sed 's/#//')
#update_or_append "color15" $(echo $shade8 | sed 's/#//')

echo "Kitty colorscheme updated successfully!"

