#!/bin/sh
# xdg-open wrapper to use Windows/macOs host applications

open_with_terminal() {
  if [ -f "$1" ] || [ -d "$1" ]; then
    command -v yazi >/dev/null 2>&1 && exec yazi "$1"
  else
    command -v curl >/dev/null 2>&1 || exit 1
    command -v bat >/dev/null 2>&1 && exec curl -Ls "$1" | bat
    exec curl -Ls "$1"
  fi

  exit 1
}

open_with_windows() {
  if [ -f "$1" ] || [ -d "$1" ]; then
    windows_path=$(wslpath -w "$1")
    cmd.exe /c start "" "$windows_path"
  else
    cmd.exe /c start "" "$1"
  fi

  exit
}

if [ $# -eq 0 ]; then
  echo "Usage: xdg-open <file|url>" >&2
  exit 1
fi

# macOS
if [ "$(uname)" = "Darwin" ]; then
  exec open "$@"
fi

# WSL
if [ -f /proc/version ] && grep -qi microsoft /proc/version; then
  # If WSL interop not available
  if ! command -v cmd.exe >/dev/null 2>&1; then
    open_with_terminal "$@"
  fi
  open_with_windows "$@"
fi

# Try system xdg-open
if [ -x /usr/bin/xdg-open ]; then
  exec /usr/bin/xdg-open "$@"
fi

open_with_terminal "$@"
