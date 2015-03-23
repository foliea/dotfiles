#!/bin/sh
set -e

if [ ! $MACHINE ]; then MACHINE="0.1.0" ; fi

os=$(uname -s | awk '{print tolower($0)}')

wget https://github.com/docker/machine/releases/download/v$MACHINE/docker-machine_$os-amd64

mv -f docker-machine_$os-amd64 /usr/local/bin/docker-machine

chmod +x /usr/local/bin/docker-machine
