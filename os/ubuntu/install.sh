#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Discord (via community APT repo)
curl -sSL https://palfrey.github.io/discord-apt/discord-repo_1.2_all.deb -o /tmp/discord-repo.deb
sudo dpkg -i /tmp/discord-repo.deb
rm /tmp/discord-repo.deb

# Packages
sudo apt update

sudo apt install -y \
  chromium \
  mpv \
  caffeine \
  discord

# Ghostty
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
