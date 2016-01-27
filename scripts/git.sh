#!/bin/sh

set -e

read -p "Please specify you git user name: " username
if [ "$username" ]; then
    $(git config --global user.name "$username")
fi

read -p "Please specify you git user email: " useremail
if [ "$useremail" ]; then
    $(git config --global user.email "$useremail")
fi

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
