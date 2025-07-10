#!/bin/sh
set -e

# Install docker engine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

# Disable docker engine on boot
sudo systemctl disable docker
