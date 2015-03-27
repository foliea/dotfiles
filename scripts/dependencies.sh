#!/bin/sh
set -e

echo "Installing dependencies..."
echo "Warning! dependencies can be installed only on Darwin and Ubuntu"

os=$(uname -s | awk '{ print tolower($0) }')

./$os/install.sh

echo "Dependencies installed successfully."
