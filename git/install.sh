#!/bin/sh
set -e

config="git config --global"

for info in name email
do
    read -p "Please specify you git user $info: " userinfo
    if [ "$userinfo" ]; then
        ${config} user.$info "$userinfo"
    fi
done

${config} core.autocrlf input
${config} push.default simple
${config} pull.rebase true
${config} rerere.enabled true
${config} color.ui true
${config} core.excludesfile ~/.gitignore-global

# Aliases
${config} alias.s "status -s"
${config} alias.lg "log --oneline --decorate --all --graph"
${config} alias.pushall "push --recurse-submodules=on-demand"

ln -s $PWD/git/gitignore $HOME/.gitignore-global
