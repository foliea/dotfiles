#!/bin/sh
set -e

case "$(uname -s)" in
    Darwin*)    # macOS
        VS_CODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
        ;;
    Linux*)     # Linux
        VS_CODE_CONFIG_DIR="$HOME/.config/Code/User"
        ;;
    *)
        echo "Unsupported operating system"
        exit 1
        ;;
esac

mkdir -p "$VS_CODE_CONFIG_DIR"

ln -sf "$PWD/vscode/settings.json" "$VS_CODE_CONFIG_DIR/settings.json"
ln -sf "$PWD/vscode/keybindings.json" "$VS_CODE_CONFIG_DIR/keybindings.json"

while IFS= read -r extension; do
    if [ ! -z "$extension" ]; then
        echo "Installing extension: $extension"
        code --install-extension "$extension" --force
    fi
done < "$PWD/vscode/extensions.txt"

echo "Cursor configuration and extensions installed successfully!" 