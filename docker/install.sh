#!/bin/sh
set -e

./docker/machine.sh
./docker/compose.sh

# On darwin, bash completion is installed in brew path
if [ `uname -s` = "Darwin" ]; then
    prefix=`brew --prefix`
fi

cat ./docker/completion > $prefix/etc/bash_completion.d/docker
