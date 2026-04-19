local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "aarch64-pc-windows-msvc" then
	config.default_domain = "WSL:Ubuntu"
	config.font_size = 10
end

config.colors = {
	background = "#000000",
	foreground = "#eeeeee",
	cursor_bg = "#eeeeee",
	cursor_fg = "#000000",
	selection_bg = "#404040",
	selection_fg = "#eeeeee",
	ansi = {
		"#000000",
		"#e06c75",
		"#7fd88f",
		"#e5c07b",
		"#5c9cf5",
		"#9d7cd8",
		"#56b6c2",
		"#ffffff",
	},
	brights = {
		"#808080",
		"#e06c75",
		"#7fd88f",
		"#e5c07b",
		"#5c9cf5",
		"#9d7cd8",
		"#56b6c2",
		"#ffffff",
	},
}

return config