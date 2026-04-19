#!/bin/sh
set -e

rm -rf "$HOME/.config/git"
cp -r "$PWD/git" "$HOME/.config/git"

read -p "Please specify your git user name: " gitname
read -p "Please specify your git user email: " gitemail

if [ "$gitname" ]; then
	git config --global user.name "$gitname"
fi

if [ "$gitemail" ]; then
	git config --global user.email "$gitemail"
fi
