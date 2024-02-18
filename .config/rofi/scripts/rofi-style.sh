#!/usr/bin/env bash

set -e
set -u

# All supported choices
all=(style1 style2 style3 style4)

config_file="/home/marq/.config/rofi/scripts/.custom_config.json"
# Get the current theme from the config file
#theme=$(jq -r '.current_style' /home/marq/.config/rofi/scripts/.custom_config.json)
theme=$(jq -r '.current_style' $config_file)

declare -A texts
texts[style1]="style1"
texts[style2]="style2"
texts[style3]="style3"
texts[style4]="style4"

declare -A icons
icons[style1]="󰍹"
icons[style2]="󰍹"
icons[style3]="󰍹"
icons[style4]="󰍹"

declare -A actions

script="/home/marq/.config/rofi/scripts/change_style.sh"

actions[style1]="sudo $script style-1.rasi"
actions[style2]="sudo $script style-2.rasi"
actions[style3]="sudo $script style-3.rasi"
actions[style4]="sudo $script style-4.rasi"

# Print the available choices with names and icons for Rofi
for choice in "${all[@]}"; do
    echo -n "${icons[$choice]}  ${texts[$choice]}"
    if [ "$choice" == "$theme" ]; then
        echo " 󰗠"
    else
        echo
    fi
done


if [ $# -gt 0 ]; then
    selection="${1,,}" # to lower case
    selection="${selection##* }" # remove leading spaces
else
    echo "No selection provided." >&2
    exit 1
fi

# Check if the selected choice is valid
echo "$selection"
# Execute the selected action

${actions[$selection]} || true


# Save the selected choice to a file
jq '.current_style = "'"$selection"'"' $config_file > $config_file.tmp && yes | mv $config_file.tmp $config_file || true
name=${selection^} || true
# Restart rofi
killall -q rofi || true
echo "Rofi restarted with $name theme" > /tmp/rofi-theme.log

~/.config/hypr/scripts/rofi-themes 3 > /tmp/rofi-theme.log


