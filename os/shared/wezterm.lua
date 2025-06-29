local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 13
-- Works better than the built-in Tomorrow Night Eighties color scheme
config.colors = {
    -- The 16 basic ANSI colors
    ansi = {
        '#999999',
        '#f2777a',
        '#99cc99',
        '#ffcc66',
        '#6699cc',
        '#cc99cc',
        '#66cccc',
        '#cccccc',
    },
    brights = {
        '#999999',
        '#f2777a',
        '#99cc99',
        '#ffcc66',
        '#6699cc',
        '#cc99cc',
        '#66cccc',
        '#cccccc',
    },
    background = '#2d2d2d',
    foreground = '#cccccc',
    cursor_bg = '#cccccc',
    cursor_fg = '#2d2d2d',
    selection_bg = '#515151',
    selection_fg = '#ffffff',
}

-- Apply WSL default only on Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "aarch64-pc-windows-msvc" then
    config.default_domain = 'WSL:Ubuntu'
    config.font_size = 10
end

return config
