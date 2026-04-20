#!/bin/sh
set -e

rm -f "$HOME/.local/bin/opencode"
curl -fsSL https://opencode.ai/install | bash
mv "$HOME/.opencode/bin/opencode" "$HOME/.local/bin/opencode"
rm -rf "$HOME/.opencode"
