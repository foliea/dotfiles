#!/bin/sh
set -e

# Install docker engine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

# Disable docker engine on boot
read -p "Do you want to disable Docker service on boot? (y/n): " disable_docker
if [ "$disable_docker" = "y" ]; then
	sudo systemctl disable docker
	sudo systemctl disable docker.socket
fi
