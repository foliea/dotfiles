#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Ghostty
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
