#!/usr/bin/env bash


defaultPath=~/Pictures/backgrounds
favoritesPath="/home/marq/Pictures/backgrounds/Favorites/"

# if there is a "Favorites" folder, but its empty, delete it

# print the values of all the arguments seperated by a "|"
echo "Arguments: $*" > /tmp/rofiar.log
# save into a string and then int rofi2.log


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
    swww img ~/Pictures/backgrounds/.current_background.jpg --transition-type any
    eww reload || true
    ~/.config/hypr/scripts/rofi-themes 2 "$folder" >> /dev/null
}

printDirectory() {
    path="$1/"
    # if the current path is not the default path
    if [ "$path" != "$defaultPath/" ]; then
        echo "  .."
    fi

    files=$(ls -1 "$path" | wc -l)
    
    # if the current path is the default path
    if [ -d "$favoritesPath" ]; then
        # if the current path is the base path, print "  Favorites"
        if [ "$path" == "$defaultPath/" ]; then
            echo "  Favorites"
        fi
    fi

    for file in "$path"/*; do
        name=$(basename "$file")
        name="${name%.*}"
        if [ "$name" == ".current_background.jpg" ]; then
            continue
        fi

        # if its a directory print  Name
        if [ -d "$file" ]; then
            # if its "Favorites" skip
            if [ "$name" == "Favorites" ]; then
                continue
            fi
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

printOptions() {
    echo "  Go back"
    # echo "  Favorite"
    # if the background is in the favorites folder, print "  Unfavorite"
    # # check for png or jpg (use the variable favoritesPath)
    if [ -f "$favoritesPath/$selection.jpg" ] || [ -f "$favoritesPath/$selection.png" ]; then
        echo "  Unfavorite"
    else
        echo "  Favorite"
    fi
    echo "  Set as background"
    echo "󰋩  $selection"
}

setFavorite() {
    echo "Setting $selection as favorite" > /tmp/rofi.log
    # if there is no favorites folder create it (use the variable favoritesPath)
    if [ ! -d "$favoritesPath" ]; then
        echo "mkdir $favoritesPath" > /tmp/rofi.log
        mkdir "$favoritesPath"
    fi
    echo "Successfully created $favoritesPath" >> /tmp/rofi.log
    # check if you should append .jpg or .png
    if [ -f "$path/$selection.jpg" ]; then
        selection="$selection.jpg"
    elif [ -f "$path/$selection.png" ]; then
        selection="$selection.png"
    else
        echo "No file found with the name $selection" >&2
        exit 1
    fi
    # create a symlink to the file in the favorites folder
    ln -s "$path/$selection" "$favoritesPath/$selection"
}

unsetFavorite() {
    echo "Unsetting $selection as favorite" > /tmp/rofi.log
    # remove the symlink from the favorites folder
    # check if you should append .jpg or .png
    #

    echo "Checking if $favoritesPath/$selection.png exists" > /tmp/rofi6.log
    echo "Checking if $favoritesPath/$selection.jpg exists" >> /tmp/rofi6.log

    if [ -f "$favoritesPath$selection.jpg" ]; then
        echo "rm $favoritesPath$selection.jpg" > /tmp/rofi6.log
        rm "$favoritesPath$selection.jpg"
    elif [ -f "$favoritesPath$selection.png" ]; then
        echo "rm $favoritesPath$selection.png" > /tmp/rofi6.log
        rm "$favoritesPath$selection.png"
    else
        echo "No file found with the name $selection" >&2
        exit 1
    fi


    echo "Found $selection" > /tmp/rofi2.log


    # if the favorites folder is empty, delete it (use the variable favoritesPath)
    if [ ! "$(ls -A $favoritesPath)" ]; then
        echo "rm -r $favoritesPath" > /tmp/rofi.log
        rm -r $favoritesPath
    fi
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
    for selection; do true; done
    # pritn number of arguments
    echo "Number of arguments: $#" > /tmp/rofi5.log
    echo "Arguments: $*" >> /tmp/rofi5.log
    if [[ $selection == *""* ]]; then
        echo "Selection is a directory" > /tmp/rofi.log
        selection="${selection#*  }"
        if [ "$selection" == ".." ]; then
            path=$(dirname "$path")
        else
            path="$path/$selection/"
        fi
        killall -q rofi
        ~/.config/hypr/scripts/rofi-themes 2 "$path" >> /dev/null
        exit 0

        # If an image got selected, open the options menu
    elif [[ $selection == *"󰗠"* ]] || [[ $selection == *"󰗡"* ]]; then
        echo "Image got selected $selection" > /tmp/rofi.log
        # strip the first 5 characters
        selection="${selection#*󰗠  }"
        selection="${selection#*󰗡  }"
        selection="${selection#[0-9]*.) }"
        echo "Image got selected $selection" >> /tmp/rofi.log
        killall -q rofi
        ~/.config/hypr/scripts/rofi-themes 2 "$path" "\"$selection\"" >> /dev/null
        exit 1
        # if there are 3 arguments, the last one is the path
    elif [[ $selection == *""* ]]; then
        num_args=$#
        selection_index=$((num_args-1))
        selection="${!selection_index}"
        selection="${selection#*  }"
        selection="${selection#*󰋩  }"
        echo "Setting $selection as background" > /tmp/rofi.log
        killall -q rofi
        setBackground
        exit 0
        # if we want to set the background as favorite
    elif [[ $selection == *""* ]]; then
        num_args=$#
        selection_index=$((num_args-1))
        selection="${!selection_index}"
        selection="${selection#*  }"
        selection="${selection#*󰋩  }"
        echo "Removing $selection favorite" > /tmp/rofi6.log
        killall -q rofi
        unsetFavorite
        # if the favorites folder got deleted AND was the currnet path, go back to the default pat
        if [ ! -d $favoritesPath ] && [ "$path" == "$favoritesPath" ]; then
            path=$defaultPath
        fi

        ~/.config/hypr/scripts/rofi-themes 2 "$path" >> /dev/null
        exit 0
    elif [[ $selection == *""* ]]; then
        num_args=$#
        selection_index=$((num_args-1))
        selection="${!selection_index}"
        selection="${selection#*  }"
        selection="${selection#*󰋩  }"
        echo "Setting $selection as favorite" > /tmp/rofi6.log
        killall -q rofi
        setFavorite
        ~/.config/hypr/scripts/rofi-themes 2 "$path" >> /dev/null
        exit 0
        # if we selected the image icon
    elif [[ $selection == *"󰋩"* ]]; then
        echo "Selected image" > /tmp/rofi9.log
        echo "Arguments: $*" >> /tmp/rofi9.log
        num_args=$#
        selection_index=$((num_args-1))
        echo "Selection index: $selection_index" >> /tmp/rofi9.log
        selection="${!selection_index}"
        echo "Selection: $selection" >> /tmp/rofi9.log
        selection="${selection#*󰋩  }"
        # check if you should append .jpg or .png
        if [ -f "$path/$selection.jpg" ]; then
            selection="$selection.jpg"
        elif [ -f "$path/$selection.png" ]; then
            selection="$selection.png"
        else
            echo "No file found with the name $selection" >&2
            exit 1
        fi
        killall -q rofi
        echo "Setting $path$selection as background" > /tmp/rofi10.log
        mupdf "$path$selection" > /tmp/rofi7.log 2>&1 &
        ~/.config/hypr/scripts/rofi-themes 2 "$path" >> /dev/null
        exit 0


        
    elif [ $# -eq 3 ]; then
        echo "3 arguments" > /tmp/rofi.log
        printOptions
        echo "󰋩  $selection" > /tmp/rofi.log
        exit 0
        # if we want to set the background


    else
        printDirectory "$path"
        exit 0
    fi

else
    printDirectory "$path"
    exit 1
fi
