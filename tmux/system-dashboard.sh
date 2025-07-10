#!/bin/sh
set -e

TARGET_DIR="$HOME"

tmux new-window -n "󰨇 system" -c "$TARGET_DIR"

tmux split-window -h -c "$TARGET_DIR"
tmux split-window -v -t 0 -c "$TARGET_DIR"
tmux split-window -v -t 2 -c "$TARGET_DIR"

tmux send-keys -t 0 "yazi" C-m
tmux send-keys -t 1 "fastfetch" C-m
tmux send-keys -t 2 "btop" C-m
tmux send-keys -t 3 "lazydocker" C-m

tmux select-pane -t 1
