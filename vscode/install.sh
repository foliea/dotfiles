#!/bin/sh
set -e

if ! command -v code >/dev/null 2>&1; then
    echo "Error: 'code' command not found. Please ensure Visual Studio Code is installed and the 'code' command is added to your PATH."
    exit 1
fi

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