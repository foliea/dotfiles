#!/bin/sh

set -e

read -p "Please specify you git user name: " username
if [ "$username" ]; then
    git config --global user.name "$username"
fi

read -p "Please specify you git user email: " useremail
if [ "$useremail" ]; then
    git config --global user.email "$useremail"
fi
