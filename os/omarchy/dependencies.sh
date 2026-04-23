#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/dependencies.sh"

omarchy-pkg-add \
  "FiraCode Nerd Font" \
  yazi \
  git-delta \
  makima-bin \
  k9s
