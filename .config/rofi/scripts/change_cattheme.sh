#!/bin/bash

coffee_type=$1
debug=$2

# if debug is none, set it to 0 else if it is 1 set it to "1"
if [ -z "$debug" ]; then
    debug=0
elif [ "$debug" -eq "1" ]; then
    debug="1"
fi


# Define the directory where your scripts are located
script_dir=/home/marq/.config/rofi/scripts/change_cattheme

# Open a new screen and run each function within it {dunst, eww, grub, kitty, rofi, sddm, spicetify}
for file in $script_dir/update_*; do
    sudo screen -dmS "change_cattheme_$(basename "$file" | cut -d'_' -f2-)" bash -c "$file $coffee_type $debug"
done



# Call other functions similarly



