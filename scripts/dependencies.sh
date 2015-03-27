#!/bin/sh
set -e

echo "Installing dependencies..."
echo "Warning! dependencies can be installed only on Darwin and Ubuntu"

if [ `uname -s` = "Darwin" ]; then
    ./darwin/install.sh
elif [ `uname -s` = "Linux" ]; then
    ./ubuntu/install.sh
fi

./docker/install.sh

echo "Dependencies installed successfully."
