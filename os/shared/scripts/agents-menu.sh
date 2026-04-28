#!/bin/sh

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/installs/node/latest/bin:$PATH"

run() {
  if [ -n "$TMUX" ]; then
    tmux new-window -a -c "$PWD" -n "$choice:$(basename "$PWD")" "$1"
  else
    exec $1
  fi
}

options=""
command -v opencode >/dev/null 2>&1 && options="${options}opencode\n"
command -v agent >/dev/null 2>&1 && options="${options}cursor\n"
options="termly\n${options}"

choice=$(printf "%b" "$options" | fzf --prompt="Start agent:" --height=100% --reverse)

case "$choice" in
termly)
  if command -v termly >/dev/null 2>&1; then
    run "termly start"
  else
    run "node-global-install @termly-dev/cli && termly start"
  fi
  ;;
opencode) run "opencode" ;;
cursor) run "cursor-agent" ;;
esac
