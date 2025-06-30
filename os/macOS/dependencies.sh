#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/dependencies.sh"

brew install rar

brew install --cask font-fira-code-nerd-font
