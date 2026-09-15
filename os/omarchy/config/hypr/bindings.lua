-- Personal keybindings. Defaults sharing a key are unbound first so they are
-- replaced, not stacked. See current bindings with: omarchy menu keybindings --print

-- App bindings (the keys below were bound to different apps by Omarchy).
hl.unbind("SUPER + SHIFT + M")  -- was: Music (Spotify)
o.bind("SUPER + SHIFT + M", "Music", { webapp = "https://music.youtube.com" })

hl.unbind("SUPER + SHIFT + N")  -- was: Editor
o.bind("SUPER + SHIFT + N", "Notes", { webapp = "https://keep.google.com" })

hl.unbind("SUPER + SHIFT + E")  -- was: Email (Hey)
o.bind("SUPER + SHIFT + E", "Editor", { omarchy = "editor" })

hl.unbind("SUPER + SHIFT + G")  -- was: Signal
o.bind("SUPER + SHIFT + G", "Lazygit", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" -e lazygit')

hl.unbind("SUPER + SHIFT + D")  -- was: Docker (Omarchy TUI)
o.bind("SUPER + SHIFT + D", "Docker", { tui = "lazydocker" })

hl.unbind("SUPER + SHIFT + A")  -- was: ChatGPT
o.bind("SUPER + SHIFT + A", "Gemini", { webapp = "https://gemini.google.com" })

hl.unbind("SUPER + SHIFT + C")  -- was: Calendar (Hey)
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://calendar.google.com" })

-- Move focus with ALT + vim keys (h, j, k, l).
o.bind("ALT + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("ALT + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
o.bind("ALT + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("ALT + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))

-- Swap active window with the one next to it with ALT + SHIFT + vim keys.
o.bind("ALT + SHIFT + H", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("ALT + SHIFT + L", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("ALT + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("ALT + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- Close window.
o.bind("ALT + W", "Close window", hl.dsp.window.close())

-- Toggle 3-column "gaming mode" on the active workspace (centered master,
-- two side panels). Persisted per-workspace by toggle-gaming-mode.
o.bind("SUPER + SHIFT + T", "Toggle gaming mode layout", "toggle-gaming-mode.sh")