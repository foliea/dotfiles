#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/dependencies.sh"

omarchy-pkg-add \
  yazi \
  git-delta \
  k9s \
  sops
