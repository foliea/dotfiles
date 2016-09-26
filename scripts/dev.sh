#!/bin/sh
set -e

docker build -t dotfiles . -f ./os/"$1"/Dockerfile

docker run -ti dotfiles /bin/bash
