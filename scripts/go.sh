#!/bin/sh

set -e

if [ -z "$GOPATH" ]; then
    mkdir -p $HOME/dev/go
    export GOPATH=$HOME/dev/go
    exec $SHELL -i
    echo "GOPATH set"
fi

go get -u code.google.com/p/go.tools/cmd/oracle
go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck
go get -u code.google.com/p/rog-go/exp/cmd/godef
go get -u github.com/jstemmer/gotags

ln -s "$GOPATH"/bin "$HOME"/.vim-go
