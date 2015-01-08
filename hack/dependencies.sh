#!/bin/sh
set -e

echo "Installing dependencies..."
echo "Warning! dependencies can be installed only on Darwin and Ubuntu"

if [ `uname -s` = "Darwin" ]; then
    ./scripts/mac.sh
elif [ `uname -s` = "Linux" ]; then
    ./scripts/ubuntu.sh
fi

echo "Dependencies installed successfully."
