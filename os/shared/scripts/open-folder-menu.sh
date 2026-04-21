#!/bin/sh

choice=$(printf "%b" "System\nTerminal\n" | fzf --prompt="Open with:" --height=100% --reverse)

case "$choice" in
  System)
    if [ -n "$TMUX" ]; then
      tmux run-shell -b "xdg-open \"$@\" >/dev/null 2>&1"
    else
      exec xdg-open "$@"
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
