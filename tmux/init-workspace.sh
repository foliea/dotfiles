#!/bin/sh
set -e

TARGET_DIR="${1:-}"
NEW_WINDOW="${2:-true}"

if [ "$NEW_WINDOW" = "true" ]; then
	tmux new-window -c "$TARGET_DIR"
fi

tmux rename-window " $(basename "$TARGET_DIR")"

tmux split-window -h -p 30 -c "$TARGET_DIR"
tmux split-window -v -p 20 -t 1 -c "$TARGET_DIR"
tmux send-keys -t 0 "nvim" C-m
tmux send-keys -t 1 "$HOME/.config/tmux/launch-agent.sh" C-m
tmux select-pane -t 2
