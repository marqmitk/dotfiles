#!/usr/bin/env bash


defaultPath=~/Pictures/backgrounds

# print the values of all the arguments seperated by a "|"

# save into a string and then int rofi2.log

arguments="$*"

echo "Arguments: $arguments" > /tmp/rofi2.log

for arg in "$@"; do
    echo "arg: $arg" >> /tmp/rofi2.log
done
setBackground ()
{
    # if the selection ends with "sh" reutnr
    if [[ $selection == *"sh" ]]; then
        return
    fi
    folder="$path"
    # get path using find -name "$selection.*[jpg|png]"
    fullPath=$(find "$path/" -name "$selection.*" | head -n 1)
    if [ -z "$fullPath" ]; then
        echo "No file found with the name $selection" >&2
        exit 1
    else
        path=$fullPath
    fi

    sed -i "s|\"current_background\": \".*\"|\"current_background\": \"$path\"|" ~/.config/rofi/scripts/.custom_config.json
    cp "$path" ~/Pictures/backgrounds/.current_background.jpg
    killall swaybg || true
    swaybg -i ~/Pictures/backgrounds/.current_background.jpg &
    eww reload || true
    echo "Path: $path" > /tmp/rofi10.log
    ~/.config/hypr/scripts/rofi-themes 2 "$folder" >> /dev/null
}

printDirectory() {
    path="$1/"
    # if the current path is not the default path
    if [ "$path" != "$defaultPath/" ]; then
        echo "  .."
        echo "$path - $defaultPath" >> /tmp/rofi3.log
    fi
    for file in "$path"/*; do
        name=$(basename "$file")
        name="${name%.*}"
        if [ "$name" == ".current_background.jpg" ]; then
            continue
        fi

        # if its a directory print  Name

        if [ -d "$file" ]; then
            echo -n "  "
            echo "$name"
            continue
        fi

        if [ "$name" == "$(basename "$current_background")" ]; then
            echo -n "󰗠  "
          else 
            echo -n "󰗡  "
        fi
        echo -n "$counter.) "


        echo "$name"

        ((counter++))
    done
}

set -u
# Print all the files in ~/Pictures/backgrounds
current_background=$(jq -r '.current_background' ~/.config/rofi/scripts/.custom_config.json)
current_background="${current_background%.*}"
counter=1


path="${2:-$defaultPath}"
# if
if [ $# -gt 0 ]; then
    # selection is the last argument
    selection="${@: -1}"
    echo "selection: $selection" >> /tmp/rofi.log
    if [[ $selection == *""* ]]; then
        selection="${selection#*  }"
        echo "Started with : $selection" >> /tmp/rofi6.log
        if [ "$selection" == ".." ]; then
            path=$(dirname "$path")
        else
            path="$path/$selection/"
        fi
        killall -q rofi
        echo "Folder selected path: $path 1: $1 2: ${2:-}" >> /tmp/rofi.log
        echo "Path: $path" > /tmp/rofi.log
        ~/.config/hypr/scripts/rofi-themes 2 "$path" >> /dev/null
        exit 0

    else

        # if the selection has "󰗠" or "󰗡" then set the background

        if [[ $selection == *"󰗠"* ]] || [[ $selection == *"󰗡"* ]]; then
           
            # remove the 󰗠 or 󰗡 from the selection
            selection="${selection#*󰗠  }"
            selection="${selection#*󰗡  }"
            # remove the counter from the selection
            selection="${selection#*.) }"
            echo "Selection: $selection" >> /tmp/rofi7.log
            killall -q rofi 
            setBackground
            exit 0
        else 
            echo "Selection: $selection" >> /tmp/rofi8.log
            printDirectory "$path"
            exit 0
        fi
    fi
else
    printDirectory "$path"
    echo "No selection provided" > /tmp/rofi.log
    exit 1
fi
