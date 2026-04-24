#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Install DEBs from URLs
for pair in \
  "discord,https://palfrey.github.io/discord-apt/discord-repo_1.2_all.deb" \
  "localsend,https://github.com/localsend/app/releases/latest/download/LocalSend-linux-x86_64.deb"; do
  deb_url="${pair##*,}"
  deb_name="${pair%%,*}"
  deb_path="/tmp/${deb_name}.deb"
  curl -sSL "$deb_url" -o "$deb_path"
  sudo dpkg -i "$deb_path"
  rm "$deb_path"
done

# Packages
sudo apt update

sudo apt install -y \
  chromium \
  mpv \
  caffeine \
  discord

# Ghostty
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
