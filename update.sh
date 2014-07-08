#!/bin/sh

# Update git submodules
git submodule foreach git pull origin master
cd vim/bundle/YouCompleteMe
git submodule foreach git pull origin master
