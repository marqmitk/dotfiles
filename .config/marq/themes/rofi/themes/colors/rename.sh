#!/bin/bash

# Get the name of the script
script_name=$(basename "$0")

# Loop through each file in the directory
for file in *; do
    # Check if the file is the script itself, then skip
    if [ "$file" = "$script_name" ]; then
        continue
    fi

    # Check if the file is a regular file
    if [ -f "$file" ]; then
      # replace the last 3 characters in line 10 with "80;"
      sed -i '10s/...$/80;/' $file
    fi
done

