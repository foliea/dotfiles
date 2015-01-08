#!/bin/sh
set -e

if ! [ -x docker ]; then
    echo "You need to install docker to test this configuration."
    exit
fi

docker build -t dotfiles .
docker run -ti dotfiles /bin/bash

