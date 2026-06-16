#!/bin/sh

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"

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
command -v claude >/dev/null 2>&1 && options="${options}claude\n"
command -v vibe >/dev/null 2>&1 && options="${options}mistral\n"
command -v codex >/dev/null 2>&1 && options="${options}codex\n"
command -v gemini >/dev/null 2>&1 && options="${options}gemini\n"
command -v pi >/dev/null 2>&1 && options="${options}pi\n"
command -v crush >/dev/null 2>&1 && options="${options}crush\n"
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
cursor) run "agent" ;;
claude) run "claude" ;;
mistral) run "vibe" ;;
codex) run "codex" ;;
gemini) run "gemini" ;;
pi) run "pi" ;;
crush) run "crush" ;;
esac
