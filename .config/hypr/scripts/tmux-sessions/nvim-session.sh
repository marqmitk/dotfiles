#!/bin/bash

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "Error: tmux is not installed. Please install tmux first."
    exit 1
fi

# if a tmux session with the name "nvim" already exists, attach to it
if tmux has-session -t nvim 2>/dev/null; then
    tmux attach-session -t nvim
    exit 0
fi

# Start tmux session with name "nvim"
tmux new-session -d -s nvim

# Split the window vertically

# Start neovim in the top pane
tmux send-keys -t nvim:1 'nvim' C-m

tmux split-window -v
# make the terminal smaller
tmux resize-pane -D 10
# switch the nvim
tmux select-pane -t 0
# Attach to the tmux session
tmux attach-session -t nvim

