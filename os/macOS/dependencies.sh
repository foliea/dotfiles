#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/dependencies.sh"

brew install rar

# xdg-open shim for macOS
mkdir -p "$HOME/.local/bin"
cp "$(dirname "$0")/xdg-open.sh" "$HOME/.local/bin/xdg-open"
chmod +x "$HOME/.local/bin/xdg-open"
