#!/bin/sh

set -e

# Launch yazi file explorer
# After yazi exits, restore the pane zoom and close the pane
yazi && tmux resize-pane -Z && tmux kill-pane
