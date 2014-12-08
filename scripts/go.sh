#!/bin/sh

set -e

VERSION=1.3.1

brew install go -v $VERSION

echo "Installing vim-go dependencies..."

# Set GOPATH if none exists
if [ -z "$GOPATH" ]; then
    read -p "Please specify your GOPATH: " gopath
    if [ "$gopath" ]; then
        echo "export GOPATH=$gopath" >> "$HOME"/.bashrc
        exec $SHELL -i
    fi
fi

# Install go tools for vim-go
if [ "$GOPATH" ]; then
    go get -u code.google.com/p/go.tools/cmd/oracle
    go get -u code.google.com/p/go.tools/cmd/goimports
    go get -u github.com/nsf/gocode
    go get -u github.com/golang/lint/golint
    go get -u github.com/kisielk/errcheck
    go get -u code.google.com/p/rog-go/exp/cmd/godef
    go get -u github.com/jstemmer/gotags

    ln -s "$GOPATH"/bin "$HOME"/.vim-go
fi

echo "vim-go dependencies installed."
