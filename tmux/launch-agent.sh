#!/bin/sh
set -e

# Launch Claude Code with latest Node.js version
mise use node@latest

# Check if claude command exists, if not install it
if ! command -v claude >/dev/null 2>&1; then
	npm install -g @anthropic-ai/claude-code
fi
claude "$@"
