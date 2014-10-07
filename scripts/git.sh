#!/bin/sh

set -e

config="git config --global"

read -p "Please specify you git user name: " username
if [ "$username" ]; then
    ${config} user.name "$username"
fi

read -p "Please specify you git user email: " useremail
if [ "$useremail" ]; then
    ${config} user.email "$useremail"
fi

${config} core.autocrlf input
${config} push.default simple
${config} pull.rebase true
${config} rerere.enabled true
${config} color.ui true

# Aliases
${config} alias.s "status -s"
${config} alias.lg "log --oneline --decorate --all --graph"
