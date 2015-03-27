#!/bin/sh
set -e

docker build -t dotfiles .
docker run -ti dotfiles /bin/bash
