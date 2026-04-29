#!/bin/sh

XDG_OPEN="$HOME/.local/bin/xdg-open"

choice=$(printf "%b" "Terminal\nDesktop\n" | fzf --prompt="Open with:" --height=100% --reverse)

case "$choice" in
Terminal)
  if [ -n "$TMUX" ]; then
    tmux new-window -c "$PWD" -n "files:$(basename "$PWD")" "yazi"
  else
    exec yazi "$@"
  fi
  ;;
Desktop)
  if [ -n "$TMUX" ]; then
    tmux run-shell -b "$XDG_OPEN \"$1\" >/dev/null 2>&1"
  else
    exec "$XDG_OPEN" "$@"
  fi
  ;;
esac
