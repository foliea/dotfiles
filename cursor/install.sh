#!/bin/sh
set -e

# Detect OS and set appropriate Cursor config path
case "$(uname -s)" in
    Darwin*)    # macOS
        CURSOR_CONFIG_DIR="$HOME/Library/Application Support/Cursor/User"
        ;;
    Linux*)     # Linux
        CURSOR_CONFIG_DIR="$HOME/.config/Cursor/User"
        ;;
    *)
        echo "Unsupported operating system"
        exit 1
        ;;
esac

CURSOR_EXTENSIONS_DIR="$HOME/.cursor/extensions"

# Create Cursor config directory if it doesn't exist
mkdir -p "$CURSOR_CONFIG_DIR"
mkdir -p "$CURSOR_EXTENSIONS_DIR"

# Create symlinks for configuration files
ln -sf "$PWD/cursor/settings.json" "$CURSOR_CONFIG_DIR/settings.json"
ln -sf "$PWD/cursor/keybindings.json" "$CURSOR_CONFIG_DIR/keybindings.json"

# Install extensions
while IFS= read -r extension; do
    if [ ! -z "$extension" ]; then
        echo "Installing extension: $extension"
        cursor --install-extension "$extension" --force
    fi
done < "$PWD/cursor/extensions.txt"

echo "Cursor configuration and extensions installed successfully!" 