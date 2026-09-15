#!/usr/bin/env bash
# toggle-gaming-mode: toggle the active workspace between the normal dwindle
# layout and "gaming mode" - a centered master at ~2/3 width (2560px on the
# 3840px ultrawide) with two tiled side panels, no window gaps, and no border
# on the focused window (the game).
# Persisted per-workspace so it survives restarts (loaded automatically by
# default.hypr.workspace-layouts).
set -euo pipefail

WS=$(hyprctl activeworkspace -j | jq -r '.id')
[[ "$WS" =~ ^-?[0-9]+$ ]] || exit 1

LAYOUTS_DIR="$HOME/.local/state/omarchy/workspace-layouts"
LAYOUT_FILE="$LAYOUTS_DIR/$WS.lua"
mkdir -p "$LAYOUTS_DIR"

CLASS=$(hyprctl activewindow -j | jq -r '.class')

notify() {
  command -v omarchy-notification-send >/dev/null && omarchy-notification-send -u low "$1" || true
}

apply_rule() { # lua-args, keyword-form
  hyprctl eval "hl.workspace_rule({ workspace = \"$WS\", $1 })" >/dev/null 2>&1 ||
    hyprctl keyword workspace "$WS, $2" >/dev/null 2>&1
}

gap_defaults() { # prints "gaps_in gaps_out" from the live global config
  local in out
  in=$(hyprctl getoption general:gaps_in | rg -o '[0-9]+' | head -1) || in=5
  out=$(hyprctl getoption general:gaps_out | rg -o '[0-9]+' | head -1) || out=10
  printf '%s %s' "$in" "$out"
}

border_rule() { # border_size, class
  hyprctl eval "hl.window_rule({ border_size = $1, match = { class = \"$2\" } })" >/dev/null 2>&1 || true
}

if [[ -f "$LAYOUT_FILE" ]] && grep -q 'layout = "master"' "$LAYOUT_FILE"; then
  # Restore the border on the window that lost it in gaming mode.
  STORED_CLASS=$(grep -o 'class = "[^"]*"' "$LAYOUT_FILE" | sed 's/class = "//;s/"$//' | head -1 || true)
  rm -f "$LAYOUT_FILE"
  read -r GAP_IN GAP_OUT <<<"$(gap_defaults)"
  apply_rule "layout = \"dwindle\", gaps_in = $GAP_IN, gaps_out = $GAP_OUT" "layout:dwindle gapsin:$GAP_IN gapsout:$GAP_OUT"
  if [[ -n "$STORED_CLASS" ]]; then
    border_rule 2 "$STORED_CLASS"
  else
    [[ -n "$CLASS" ]] && border_rule 2 "$CLASS"
  fi
  notify "Gaming mode off (workspace $WS)"
else
  {
    printf 'hl.workspace_rule({ workspace = "%s", layout = "master", layout_opts = { orientation = "center" }, gaps_in = 0, gaps_out = 0 })\n' "$WS"
    printf 'hl.window_rule({ border_size = 0, match = { class = "%s" } })\n' "$CLASS"
  } >"$LAYOUT_FILE"
  apply_rule 'layout = "master", layout_opts = { orientation = "center" }, gaps_in = 0, gaps_out = 0' 'layout:master layoutopt:orientation:center gapsin:0 gapsout:0'
  # Drop the border from the focused window (the game).
  [[ -n "$CLASS" ]] && border_rule 0 "$CLASS"
  # Size the centered master to ~2560px and promote the focused window to it.
  # ignoremaster: no-op if the active window is already the master.
  hyprctl dispatch 'hl.dsp.layout("mfact exact 0.67")' >/dev/null 2>&1 || true
  hyprctl dispatch 'hl.dsp.layout("swapwithmaster ignoremaster")' >/dev/null 2>&1 || true
  notify "Gaming mode on (workspace $WS)"
fi