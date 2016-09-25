#!/bin/sh
set -e

# Docker part
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

### GREP HERE TO AVOID ECHO IF ALREADY IN SOURCE FILES

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

apt-get update -qq
apt-get install -qy docker-engine
#############

## Chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

### GREP HERE TO AVOID ECHO IF ALREADY IN SOURCE FILES

echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

apt-get install -qy software-properties-common

add-apt-repository -y ppa:webupd8team/atom
add-apt-repository -y ppa:caffeine-developers/ppa

apt-get update -qq
apt-get install -qy \
  atom \
  google-chrome-stable \
  gnome-control-center \
  gnome-online-accounts \
  caffeine \
  vlc \
  transmission
