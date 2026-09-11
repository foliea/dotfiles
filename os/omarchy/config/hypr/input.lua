-- Personal input overrides.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    kb_layout = "us",
    kb_options = "compose:caps",

    -- Change speed of keyboard repeat.
    repeat_rate = 40,
    repeat_delay = 600,

    -- Start with numlock on by default.
    numlock_by_default = true,

    touchpad = {
      -- Use natural (inverse) scrolling.
      natural_scroll = true,

      -- Control the speed of your scrolling.
      scroll_factor = 0.4,
    },
  },
})