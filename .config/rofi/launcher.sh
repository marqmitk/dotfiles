#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5

dir="$HOME/.config/rofi/themes/styles"
theme='current_style'
# literally "$*" with the quotes
additional_arguments="$*"
echo "Arguments: $additional_arguments" > /tmp/rofi-sh.log
## Run
echo $additional_arguments > /tmp/rofi-sh.log
command="rofi -theme ${dir}/${theme}.rasi ${additional_arguments}"
echo $command > /tmp/rofi-sh.log
eval $command

