#!/bin/sh
set -e

TARGET_DIR="${1:-}"
NEW_WINDOW="${2:-true}"

if [ "$NEW_WINDOW" = "true" ]; then
  tmux new-window -n "dev" -c "$TARGET_DIR"
fi

tmux split-window -h -p 30 -c "$TARGET_DIR"
tmux split-window -v -p 20 -t 0 -c "$TARGET_DIR"
tmux send-keys -t 0 "nvim" C-m
tmux send-keys -t 2 "gemini" C-m
tmux select-pane -t 1
