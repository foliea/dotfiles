#!/bin/sh
set -e

pkg="$1"
if [ -z "$pkg" ]; then
  echo "Usage: $0 <npm-package>" >&2
  exit 1
fi

if command -v mise >/dev/null 2>&1; then
  exec mise exec node@latest -- npm install -g "$pkg"
elif command -v npm >/dev/null 2>&1; then
  exec npm install -g "$pkg"
else
  echo "No installer (mise/npm) available" >&2
  exit 1
fi
