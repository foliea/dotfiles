#!/bin/sh
# xdg-open wrapper to use Windows/macOs host applications

# Check if running in WSL
if [ ! -f /proc/version ] || ! grep -qi microsoft /proc/version; then
  exec /usr/bin/xdg-open "$@"
fi

# Check if running on macOs
if [ "$(uname)" = "Darwin" ]; then
  exec open "$@"
fi

# Check if cmd.exe is available
if ! command -v cmd.exe >/dev/null 2>&1; then
  echo "Error: cmd.exe not found. Make sure Windows interop is enabled" >&2
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Usage: xdg-open <file|url>"
  exit 1
fi

# Convert WSL path to Windows path if it's a file
if [ -f "$1" ] || [ -d "$1" ]; then
  # Convert to Windows path
  windows_path=$(wslpath -w "$1")
  cmd.exe /c start "" "$windows_path"
else
  # Assume it's a URL or Windows path
  cmd.exe /c start "" "$1"
fi
