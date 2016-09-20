#!/bin/sh
set -e

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
