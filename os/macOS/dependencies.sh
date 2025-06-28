#!/bin/sh
set -e

sh "$(dirname "$0")/../linux/dependencies.sh"

brew install rar font-hack-nerd-font
