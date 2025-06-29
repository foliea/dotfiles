local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 13
config.color_scheme = 'Tomorrow Night Eighties'

if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "aarch64-pc-windows-msvc" then
    config.default_domain = 'WSL:Ubuntu'
    config.font_size = 10
end

return config
