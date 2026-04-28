#!/bin/sh

XDG_OPEN="$HOME/.local/bin/xdg-open"

choice=$(printf "%b" "System\nTerminal\n" | fzf --prompt="Open with:" --height=100% --reverse)

case "$choice" in
System)
  if [ -n "$TMUX" ]; then
    tmux run-shell -b "$XDG_OPEN \"$1\" >/dev/null 2>&1"
  else
    exec "$XDG_OPEN" "$@"
  fi
  ;;
Terminal)
  if [ -n "$TMUX" ]; then
    tmux new-window -c "$PWD" -n "files:$(basename "$PWD")" "yazi"
  else
    exec yazi "$@"
  fi
  ;;
esac
