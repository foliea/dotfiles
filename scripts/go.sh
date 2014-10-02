#!/bin/sh

set -e

$(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

gvm install go1.3.1
gvm use go1.3.1

if [ -z "$GOPATH" ]; then
    read -p "Please specify your GOPATH: " gopath
    if [ "$gopath" ]; then
        echo "export GOPATH=$gopath" >> "$HOME"/.bashrc
        exec $SHELL -i
    fi
fi

if [ -z "$GOPATH" ]; then
    go get -u code.google.com/p/go.tools/cmd/oracle
    go get -u code.google.com/p/go.tools/cmd/goimports
    go get -u github.com/nsf/gocode
    go get -u github.com/golang/lint/golint
    go get -u github.com/kisielk/errcheck
    go get -u code.google.com/p/rog-go/exp/cmd/godef
    go get -u github.com/jstemmer/gotags
    
    ln -s "$GOPATH"/bin "$HOME"/.vim-go
fi
