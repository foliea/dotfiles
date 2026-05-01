#!/bin/sh
set -e

set_forge_key() {
  dconf write /org/gnome/shell/extensions/forge/keybindings/"$1" "$2"
}

set_desktop_key() {
  dconf write /org/gnome/desktop/wm/keybindings/"$1" "$2"
}

set_shell_key() {
  dconf write /org/gnome/shell/keybindings/"$1" "$2"
}

set_mutter_key() {
  dconf write /org/gnome/mutter/"$1" "$2"
}

# Close windows
set_desktop_key close "['<Alt>w']"

# Control tiling
set_desktop_key toggle-maximized "['<Super>f']"
set_shell_key toggle-overview "['<Super>space']"
set_forge_key con-split-horizontal "@as []"
set_forge_key con-split-vertical "@as []"
set_forge_key con-split-layout-toggle "['<Super>j']"
set_forge_key con-stacked-layout-toggle "@as []"
set_forge_key con-tabbed-layout-toggle "['<Super>g']"
set_forge_key con-tabbed-showtab-decoration-toggle "@as []"
set_forge_key window-toggle-float "['<Super>t']"
set_forge_key window-toggle-always-float "@as []"
set_forge_key mod-mask-mouse-tile "'None'"

# Move focus
set_forge_key window-focus-left "['<Alt>h']"
set_forge_key window-focus-down "['<Alt>j']"
set_forge_key window-focus-up "['<Alt>k']"
set_forge_key window-focus-right "['<Alt>l']"

# Switch workspaces
set_shell_key switch-to-application-1 "@as []"
set_shell_key switch-to-application-2 "@as []"
set_shell_key switch-to-application-3 "@as []"
set_shell_key switch-to-application-4 "@as []"
set_shell_key switch-to-application-5 "@as []"
set_shell_key switch-to-application-6 "@as []"
set_shell_key switch-to-application-7 "@as []"
set_shell_key switch-to-application-8 "@as []"
set_shell_key switch-to-application-9 "@as []"
set_shell_key switch-to-application-10 "@as []"

set_desktop_key switch-to-workspace-1 "['<Super>1']"
set_desktop_key switch-to-workspace-2 "['<Super>2']"
set_desktop_key switch-to-workspace-3 "['<Super>3']"
set_desktop_key switch-to-workspace-4 "['<Super>4']"
set_desktop_key switch-to-workspace-5 "['<Super>5']"
set_desktop_key switch-to-workspace-6 "['<Super>6']"
set_desktop_key switch-to-workspace-7 "['<Super>7']"
set_desktop_key switch-to-workspace-8 "['<Super>8']"
set_desktop_key switch-to-workspace-9 "['<Super>9']"
set_desktop_key switch-to-workspace-10 "['<Super>0']"

# Move active window to a workspace
set_desktop_key move-to-workspace-1 "['<Super><Shift>1']"
set_desktop_key move-to-workspace-2 "['<Super><Shift>2']"
set_desktop_key move-to-workspace-3 "['<Super><Shift>3']"
set_desktop_key move-to-workspace-4 "['<Super><Shift>4']"
set_desktop_key move-to-workspace-5 "['<Super><Shift>5']"
set_desktop_key move-to-workspace-6 "['<Super><Shift>6']"
set_desktop_key move-to-workspace-7 "['<Super><Shift>7']"
set_desktop_key move-to-workspace-8 "['<Super><Shift>8']"
set_desktop_key move-to-workspace-9 "['<Super><Shift>9']"
set_desktop_key move-to-workspace-10 "['<Super><Shift>0']"

# TAB between workspaces
set_desktop_key switch-to-workspace-left "['<Super>Tab']"
set_desktop_key switch-to-workspace-right "['<Super><Shift>Tab']"

# Swap active window
set_forge_key window-swap-left "@as []"
set_forge_key window-swap-down "@as []"
set_forge_key window-swap-up "@as []"
set_forge_key window-swap-right "@as []"
set_forge_key window-swap-last-active "@as []"

# Move active window
set_forge_key window-move-left "['<Shift><Alt>h']"
set_forge_key window-move-down "['<Shift><Alt>j']"
set_forge_key window-move-up "['<Shift><Alt>k']"
set_forge_key window-move-right "['<Shift><Alt>l']"

# Cycle through windows on active workspace
set_desktop_key switch-windows "['<Alt>Tab']"
set_desktop_key switch-windows-backward "['<Alt><Shift>Tab']"

# Resize active window
set_forge_key window-resize-left-increase "['<Super>minus']"
set_forge_key window-resize-left-decrease "['<Super>equal']"
set_forge_key window-resize-top-increase "@as []"
set_forge_key window-resize-top-decrease "['<Super><Shift>minus']"
set_forge_key window-resize-bottom-increase "['<Super><Shift>equal']"
set_forge_key window-resize-bottom-decrease "@as []"
set_forge_key window-resize-right-increase "@as []"
set_forge_key window-resize-right-decrease "@as []"

# Preferences
set_forge_key prefs-open "['<Super><Shift>r']"

# Snap windows
set_forge_key window-snap-one-third-left "@as []"
set_forge_key window-snap-one-third-right "@as []"
set_forge_key window-snap-two-third-left "@as []"
set_forge_key window-snap-two-third-right "@as []"
set_forge_key window-snap-center "@as []"

# Toggle UI
set_forge_key focus-border-toggle "@as []"
set_forge_key workspace-active-tile-toggle "@as []"
set_forge_key prefs-tiling-toggle "@as []"

# Gap size
set_forge_key window-gap-size-increase "@as []"
set_forge_key window-gap-size-decrease "@as []"

# Launcher
set_mutter_key overlay-key "''" # Unbind SUPER key
