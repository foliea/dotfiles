#!/bin/sh
set -e

install_node_ls() {
    npm install -g typescript typescript-language-server
    npm install -g bash-language-server
    npm install -g dockerfile-language-server-nodejs
}

install_ruby_ls() {
    gem install solargraph
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