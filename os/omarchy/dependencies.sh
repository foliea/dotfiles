#!/bin/sh
set -e

omarchy-pkg-add git-delta
omarchy-pkg-add "FiraCode Nerd Font"
omarchy-pkg-add makima-bin

for script in xdg-open pkg-install-menu; do
  cp "$PWD/os/shared/scripts/$script.sh" "$HOME/.local/bin/$script"
  chmod +x "$HOME/.local/bin/$script"
done
