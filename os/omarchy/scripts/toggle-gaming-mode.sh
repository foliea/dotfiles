#!/usr/bin/env bash
# toggle-gaming-mode: toggle the active workspace between the normal dwindle
# layout and "gaming mode" - a centered master at ~2/3 width (2560px on the
# 3840px ultrawide) with two tiled side panels, no window gaps, and no borders
# on any window of the workspace.
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

opts_default() { # prints "gaps_in gaps_out border_size" from the live global config
  local in out border
  in=$(hyprctl getoption general:gaps_in | rg -o '[0-9]+' | head -1) || in=5
  out=$(hyprctl getoption general:gaps_out | rg -o '[0-9]+' | head -1) || out=10
  border=$(hyprctl getoption general:border_size | rg -o '[0-9]+' | head -1) || border=2
  printf '%s %s %s' "$in" "$out" "$border"
}

if [[ -f "$LAYOUT_FILE" ]] && grep -q 'layout = "master"' "$LAYOUT_FILE"; then
  rm -f "$LAYOUT_FILE"
  read -r GAP_IN GAP_OUT BORDER <<<"$(opts_default)"
  apply_rule "layout = \"dwindle\", gaps_in = $GAP_IN, gaps_out = $GAP_OUT, border_size = $BORDER" \
    "layout:dwindle gapsin:$GAP_IN gapsout:$GAP_OUT bordersize:$BORDER"
  notify "Gaming mode off (workspace $WS)"
else
  printf 'hl.workspace_rule({ workspace = "%s", layout = "master", layout_opts = { orientation = "center" }, gaps_in = 0, gaps_out = 0, border_size = false })\n' "$WS" >"$LAYOUT_FILE"
  apply_rule 'layout = "master", layout_opts = { orientation = "center" }, gaps_in = 0, gaps_out = 0, border_size = false' \
    'layout:master layoutopt:orientation:center gapsin:0 gapsout:0 bordersize:0'
  # Size the centered master to ~2560px and promote the focused window to it.
  # ignoremaster: no-op if the active window is already the master.
  hyprctl dispatch 'hl.dsp.layout("mfact exact 0.67")' >/dev/null 2>&1 || true
  hyprctl dispatch 'hl.dsp.layout("swapwithmaster ignoremaster")' >/dev/null 2>&1 || true
  notify "Gaming mode on (workspace $WS)"
fi