#!/bin/sh
set -e

config="git config --global"

for info in name email; do
	read -p "Please specify you git user $info: " userinfo
	if [ "$userinfo" ]; then
		${config} user.$info "$userinfo"
	fi
done

read -p "Do you want to sign git commits with gpg key? (y/n): " gpgsign
if [ "$gpgsign" = "y" ]; then
	${config} commit.gpgsign true
fi

${config} core.autocrlf input
${config} push.default current
${config} pull.rebase true
${config} rerere.enabled true
${config} color.ui true
${config} core.excludesfile ~/.gitignore-global
${config} protocol.version 1

# Performance optimizations for faster git operations (especially in WSL)
# - fsmonitor/untrackedcache: Improve status/add performance
# - fscache: Cache filesystem operations
# - preloadindex: Load index in memory on startup
# - index.version 4: Use latest index format
# - manyFiles: Optimize for repositories with many files
${config} core.fsmonitor true
${config} core.untrackedcache true
${config} core.fscache true
${config} core.preloadindex true
${config} index.version 4
${config} feature.manyFiles true

# Aliases
${config} alias.s "status -s"
${config} alias.lg "log --oneline --decorate --all --graph"
${config} alias.pushall "push --recurse-submodules=on-demand"

# Pager
${config} core.pager delta
${config} interactive.diffFilter 'delta --color-only'
${config} delta.navigate true
${config} delta.line-numbers true
${config} delta.side-by-side true
${config} merge.conflictStyle zdiff3

ln -sf $PWD/git/gitignore $HOME/.gitignore-global
