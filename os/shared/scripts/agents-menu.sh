#!/bin/sh

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/installs/node/latest/bin:$PATH"

run() {
  if [ -n "$TMUX" ]; then
    tmux new-window -a -c "$PWD" -n "$choice:$(basename "$PWD")" "$1"
  else
    exec sh -c "$1"
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
    run "termly start; termly cleanup"
  else
    run "npm-global-install @termly-dev/cli && termly start; termly cleanup"
  fi
  ;;
opencode) run "opencode" ;;
cursor) run "cursor-agent" ;;
esac
