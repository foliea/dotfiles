-- Personal input overrides.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    kb_layout = "us",
    kb_options = "",

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

-- Slower pointer speed for the external/wireless mice only.
-- Negative = slower. Adjust to taste (e.g. -0.3 milder, -0.8 much slower).
hl.device({ name = "corsair-corsair-slipstream-wireless-usb-receiver", sensitivity = -0.5 })
hl.device({ name = "steelseries-rival-3-wireless-gen-2", sensitivity = -0.5 })