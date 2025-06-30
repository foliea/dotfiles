#!/bin/sh
set -e

install_node_ls() {
    npm install -g typescript typescript-language-server
    npm install -g bash-language-server
    npm install -g dockerfile-language-server-nodejs
    npm install -g @prisma/language-server
    npm install -g vscode-json-languageserver

    if command -v nvim >/dev/null 2>&1; then
        nvim --headless -c "TSUpdate all" -c "qa!"
    fi
}

install_ruby_ls() {
    gem install solargraph

    if command -v nvim >/dev/null 2>&1; then
        nvim --headless -c "TSUpdate ruby" -c "qa!"
    fi
}

case "$1" in
    node)
        install_node_ls
        ;;
    ruby)
        install_ruby_ls
        ;;
    all|"")
        install_node_ls
        install_ruby_ls
        ;;
    *)
        echo "Usage: $0 [node|ruby|all]"
        exit 1
        ;;
esac
