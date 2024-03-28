#!/bin/bash

# Set default values
monitor_id=1
lastState=0

# Function to perform actions when no window is open
noWindowOpenAction () {
  if [ "$lastState" -ne 0 ]; then
    eww open-many weather calendar clock
    lastState=0
  fi
}

# Function to perform actions when a window is open
windowOpenAction () {
  if [ "$lastState" -ne 1 ]; then
    eww close-all
    lastState=1
  fi
}

# Main loop
while true; do 
  # Get monitor information
  monitor_json=$(hyprctl monitors -j)
  activeWorkspace=$(jq -r ".[] | select(.id == $monitor_id) | .activeWorkspace.id" <<< "$monitor_json")
  specialWorkspace=$(jq -r ".[] | select(.id == $monitor_id) | .specialWorkspace.id" <<< "$monitor_json")

  # Get workspace information
  workspace_json=$(hyprctl workspaces -j)
  lastwindowtitle=$(jq -r --arg activeWorkspace "$activeWorkspace" '.[] | select(.id == ($activeWorkspace | tonumber)) | .lastwindowtitle' <<< "$workspace_json")

  # Check if special workspace is active and has a window open
  if [ "$specialWorkspace" -ne 0 ]; then
    special_lastwindowtitle=$(jq -r --arg specialWorkspace "$specialWorkspace" '.[] | select(.id == ($specialWorkspace | tonumber)) | .lastwindowtitle' <<< "$workspace_json")
    if [ -n "$special_lastwindowtitle" ]; then
      windowOpenAction
      continue
    fi
  fi

  # Check if any window is open
  if [ -z "$lastwindowtitle" ]; then
    noWindowOpenAction
  else
    windowOpenAction
  fi

  sleep 0.5
done

