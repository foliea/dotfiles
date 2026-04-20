#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/dependencies.sh"

brew install rar
