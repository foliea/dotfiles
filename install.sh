#!/bin/sh

# Git config
git config --global user.name "Adrien Folie"
git config --global user.email "folie.adrien@gmail.com"

# Github config
git config --global github.user "folieadrien"

# Bashrc
ln -s .bashrc ~/.bashrc
source ~/.bashrc
