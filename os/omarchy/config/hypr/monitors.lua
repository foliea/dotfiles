-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

hl.env("GDK_SCALE", "1")
hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "auto", scale = 1.6 })
hl.monitor({ output = "DP-1", mode = "3840x1600@120", position = "auto", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })