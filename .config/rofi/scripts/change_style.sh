#!/bin/bash

style_name=$1
debug=$2

# if debug is none, set it to 0 else if it is 1 set it to "1"
if [ -z "$debug" ]; then
    debug=0
elif [ "$debug" -eq "1" ]; then
    debug="1"
fi


style_path="/home/marq/.config/rofi/themes/styles"
command="screen -dmS styleChanger cp $style_path/$style_name '$style_path/current_style.rasi'"
echo $command
eval $command
