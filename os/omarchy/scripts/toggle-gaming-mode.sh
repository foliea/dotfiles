#!/usr/bin/env bash
# hyper-toggle-gaming-mode: toggle the active workspace between the normal
# dwindle layout and "gaming mode" - a centered master at ~2/3 width
# (2560px on the 3840px ultrawide) with two tiled side panels.
# Persisted per-workspace so it survives restarts (loaded automatically by
# default.hypr.workspace-layouts).
set -euo pipefail

WS=$(hyprctl activeworkspace -j | jq -r '.id')
[[ "$WS" =~ ^-?[0-9]+$ ]] || exit 1

LAYOUTS_DIR="$HOME/.local/state/omarchy/workspace-layouts"
LAYOUT_FILE="$LAYOUTS_DIR/$WS.lua"
mkdir -p "$LAYOUTS_DIR"

notify() {
  command -v omarchy-notification-send >/dev/null && omarchy-notification-send -u low "$1" || true
}

apply_rule() { # lua-args, keyword-form
  hyprctl eval "hl.workspace_rule({ workspace = \"$WS\", $1 })" >/dev/null 2>&1 ||
    hyprctl keyword workspace "$WS, $2" >/dev/null 2>&1
}

if [[ -f "$LAYOUT_FILE" ]] && grep -q 'layout = "master"' "$LAYOUT_FILE"; then
  rm -f "$LAYOUT_FILE"
  apply_rule 'layout = "dwindle"' 'layout:dwindle'
  notify "Gaming mode off (workspace $WS)"
else
  printf 'hl.workspace_rule({ workspace = "%s", layout = "master", layout_opts = { orientation = "center" } })\n' "$WS" >"$LAYOUT_FILE"
  apply_rule 'layout = "master", layout_opts = { orientation = "center" }' 'layout:master layoutopt:orientation:center'
  # Size the centered master to ~2560px and promote the focused window to it.
  # ignoremaster: no-op if the active window is already the master.
  hyprctl dispatch 'hl.dsp.layout("mfact exact 0.67")' >/dev/null 2>&1 || true
  hyprctl dispatch 'hl.dsp.layout("swapwithmaster ignoremaster")' >/dev/null 2>&1 || true
  notify "Gaming mode on (workspace $WS)"
fi