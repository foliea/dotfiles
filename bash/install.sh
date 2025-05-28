#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/bash"

# Create necessary directories
mkdir -p "$CONFIG_DIR/conf.d"

# Create symlinks
ln -sf "$SCRIPT_DIR/bashrc" "$HOME/.bashrc"
ln -sf "$SCRIPT_DIR/bash_profile" "$HOME/.bash_profile"
ln -sf "$SCRIPT_DIR/conf.d" "$CONFIG_DIR/"

# Install dependencies if they don't exist
command -v hub >/dev/null 2>&1 || echo "Warning: 'hub' is not installed. Install it for git alias functionality."
command -v rbenv >/dev/null 2>&1 || echo "Warning: 'rbenv' is not installed. Install it for Ruby version management."

echo "Bash configuration installed successfully!"
echo "Please restart your shell or run 'source ~/.bashrc' to apply changes."

