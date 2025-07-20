-- Load plugin management, options, keymaps, autocommands, LSP, and user commands modules
require("plugins")
require("options")
require("autocmds")
require("lsp")
require("usercmds")
require("highlights")

pcall(function()
	require("dashboard").setup({
		theme = "hyper",
		hide = {
			statusline = true,
			tabline = true,
			winbar = true,
		},
		config = {
			header = {},
			disable_move = true,
			week_header = {
				enable = false,
			},
			packages = {
				enable = false,
			},
			project = {
				enable = false,
			},
			footer = {},
			shortcut = {},
		},
	})
end)

pcall(function()
	local highlight = {
		"Whitespace",
		"CursorColumn",
	}
	require("ibl").setup({
		exclude = { filetypes = { "dashboard" } },
		indent = {
			highlight = highlight,
			char = " ",
		},
		whitespace = {
			highlight = highlight,
			remove_blankline_trail = false,
		},
		scope = { enabled = false },
	})
end)

pcall(function()
	require("telescope").setup({
		defaults = { hidden = true },
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	require("telescope").load_extension("ui-select")
	require("telescope").load_extension("fzf")
end)

pcall(function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"ruby",
			"javascript",
			"typescript",
			"lua",
			"bash",
			"fish",
			"dockerfile",
			"json",
			"yaml",
			"markdown",
			"prisma",
			"graphql",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		modules = {},
		sync_install = false,
		ignore_install = {},
		auto_install = false,
		parser_install_dir = nil,
	})
end)

-- Gitsigns setup
pcall(function()
	require("gitsigns").setup({
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	})
end)

-- Git diff view setup
pcall(function()
	require("diffview").setup()
end)

pcall(function()
	require("outline").setup()
end)

-- NvimTree setup
pcall(function()
	require("nvim-tree").setup({
		filters = {
			custom = {
				"^.git$",
				"^.DS_Store$",
				"^node_modules$",
				"dist",
				"build",
				"__pycache__",
				"%.o$",
				"%.swp$",
			},
		},
	})
end)

pcall(function()
	require("todo-comments").setup()
end)

pcall(function()
	require("nvim-web-devicons").setup()
end)

pcall(function()
	require("trouble").setup({})
end)

pcall(function()
	require("nvim-highlight-colors").setup({
		render = "background",
		enable_tailwind = true,
		tailwind = {
			colors = {
				["bg"] = "#1a202c",
				["text"] = "#cbd5e0",
			},
		},
	})
end)

pcall(function()
	require("cinnamon").setup({
		disabled = false,
		keymaps = { basic = true, extra = true },
		options = { mode = "window" },
	})
end)

pcall(function()
	vim.notify = require("notify")
end)

-- Lualine setup (after plugin block)
pcall(function()
	require("lualine").setup({
		options = {
			theme = "auto",
			icons_enabled = true,
			section_separators = "",
			component_separators = "",
		},
		sections = {
			lualine_b = {
				{ "branch", icon = "" },
				{
					"diff",
					colored = false,
					symbols = { added = " ", modified = " ", removed = " " },
				},
			},
			lualine_c = {
				{ "filename", path = 1 },
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
				},
			},
			lualine_x = { "filetype" },
			lualine_y = { "encoding" },
			lualine_z = {
				{
					"location",
					fmt = function()
						local line = vim.fn.line(".")
						local col = vim.fn.col(".")
						return string.format(" %d  %d", line, col)
					end,
				},
			},
		},
	})
end)

pcall(function()
	local colors = require("colors")

	require("bufferline").setup({
		options = {
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			separator_style = "slant",
			themable = true,
		},
		highlights = {
			modified = {
				fg = colors.yellow,
			},
			modified_visible = {
				fg = colors.yellow,
			},
			modified_selected = {
				fg = colors.yellow,
			},
			fill = {
				bg = colors.background_deep,
			},
			separator = {
				fg = colors.background_deep,
			},
			separator_visible = {
				fg = colors.background_deep,
			},
			separator_selected = {
				fg = colors.background_deep,
			},
			tab_separator = {
				fg = colors.background_deep,
			},
			tab_separator_selected = {
				fg = colors.background_deep,
			},
			group_label = {
				fg = colors.background_deep,
			},
			trunc_marker = {
				bg = colors.background_deep,
			},
			offset_separator = {
				bg = colors.background_deep,
			},
			group_separator = {
				bg = colors.background_deep,
			},
		},
	})
end)

-- UFO setup
pcall(function()
	require("ufo").setup({
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	})
end)

pcall(function()
	local utils = require("utils")
	local js_formatters = utils.get_js_formatters()

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = js_formatters,
			typescript = js_formatters,
			sh = { "shfmt" },
			make = { "beautysh" },
			dockerfile = { "beautysh" },
			fish = { "fish_indent" },
			ruby = { "rubocop" },
			terraform = { "terraform_fmt" },
		},
		formatters = {
			rubocop = {
				prepend_args = { "--disable-uncorrectable" },
			},
		},
	})
end)

require("keymaps")
