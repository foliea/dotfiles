#!/bin/sh
set -e

target="$1"

os_type=$(uname -s | awk '{ print tolower($0) }')

echo "Installing dependencies..."
echo "Warning! dependencies can be installed only on macOS and Linux (Debian or Arch based)"

if [ $os_type = "linux" ]; then
  if [ $(which pacman 2>/dev/null) ]; then
    os_base="arch"
  elif [ $(which apt-get 2>/dev/null) ]; then
      os_base="debian"
  else
    echo "OS base unsupported."
    exit 1
  fi
elif [ $os_type = "darwin" ]; then
  os_base=$os_type
else
  echo "OS type unsupported."
  exit 1
fi

eval ./os/$os_base/$target.sh