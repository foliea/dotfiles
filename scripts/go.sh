#!/bin/sh

if [ -z "$GOPATH" ]; then
    mkdir -p $HOME/dev/go
    export GOPATH=$HOME/dev/go
    exec $SHELL -i
    echo "GOPATH set"
fi
