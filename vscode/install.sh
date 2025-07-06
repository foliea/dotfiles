#!/bin/sh
set -e

if ! command -v code >/dev/null 2>&1; then
    echo "Error: 'code' command not found. Please ensure Visual Studio Code is installed and the 'code' command is added to your PATH."
    exit 1
fi

IS_WSL=false

case "$(uname -s)" in
    Darwin*)    # macOS
        VS_CODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
        ;;
    Linux*)     # Linux / WSL
        if [ -d "$HOME/.vscode-server" ]; then
            VS_CODE_CONFIG_DIR="$HOME/.vscode-server/data/Machine"
        else
            VS_CODE_CONFIG_DIR="$HOME/.config/Code/User"
        fi
        if grep -qEi "WSL" /proc/version; then
            IS_WSL=true
        fi
        ;;
    *)
        echo "Unsupported operating system"
        exit 1
        ;;
esac

mkdir -p "$VS_CODE_CONFIG_DIR"

ln -sf "$PWD/vscode/settings.json" "$VS_CODE_CONFIG_DIR/settings.json"

if [ "$IS_WSL" = false ]; then
    ln -sf "$PWD/vscode/keybindings.json" "$VS_CODE_CONFIG_DIR/keybindings.json"
else
    win_user=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

    cp "$PWD/vscode/settings.json" "/mnt/c/Users/$win_user/AppData/Roaming/Code/User/settings.json"
    cp "$PWD/vscode/keybindings.json" "/mnt/c/Users/$win_user/AppData/Roaming/Code/User/keybindings.json"
fi

if [ ! -d "$HOME/.vscode-server" ]; then
    while IFS= read -r extension; do
        if [ ! -z "$extension" ]; then
            echo "Installing host extension: $extension"

            code --install-extension "$extension" --force
        fi
    done < "$PWD/vscode/host-extensions.txt"
fi

while IFS= read -r extension; do
    if [ ! -z "$extension" ]; then
        echo "Installing remote extension: $extension"
        code --install-extension "$extension" --force
    fi
done < "$PWD/vscode/remote-extensions.txt"
