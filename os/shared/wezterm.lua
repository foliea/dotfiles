local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

-- Apply WSL default only on Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "aarch64-pc-windows-msvc" then
	config.default_domain = "WSL:Ubuntu"
	config.font_size = 10
end

-- Load colors from themes/default/wezterm.json with fallback
local function load_theme_colors()
	local home = os.getenv("HOME")
	local theme_path = home .. "/.config/themes/default/wezterm.json"

	-- Try to read the file
	local file = io.open(theme_path, "r")
	if not file then
		return nil
	end

	local content = file:read("*all")
	file:close()

	if not content then
		return nil
	end

	-- Simple JSON parsing for our specific structure
	local colors = {}

	-- Extract basic colors
	colors.background = content:match('"background"%s*:%s*"([^"]+)"')
	colors.foreground = content:match('"foreground"%s*:%s*"([^"]+)"')
	colors.cursor_bg = content:match('"cursor_bg"%s*:%s*"([^"]+)"')
	colors.cursor_fg = content:match('"cursor_fg"%s*:%s*"([^"]+)"')
	colors.selection_bg = content:match('"selection_bg"%s*:%s*"([^"]+)"')
	colors.selection_fg = content:match('"selection_fg"%s*:%s*"([^"]+)"')

	-- Extract ansi array
	local ansi_section = content:match('"ansi"%s*:%s*%[([^%]]+)%]')
	if ansi_section then
		colors.ansi = {}
		for color in ansi_section:gmatch('"([^"]+)"') do
			table.insert(colors.ansi, color)
		end
	end

	-- Extract brights array
	local brights_section = content:match('"brights"%s*:%s*%[([^%]]+)%]')
	if brights_section then
		colors.brights = {}
		for color in brights_section:gmatch('"([^"]+)"') do
			table.insert(colors.brights, color)
		end
	end

	return colors
end

-- Try to load theme colors, fallback to hardcoded if it fails
local theme_colors = load_theme_colors()

config.colors = theme_colors

return config

