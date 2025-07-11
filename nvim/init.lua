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
		keymaps = {
			basic = true,
			extra = true,
		},
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
					fmt = function(str)
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
				fg = "#ffcc66",
			},
			modified_visible = {
				fg = "#ffcc66",
			},
			modified_selected = {
				fg = "#ffcc66",
			},
		},
	})
end)

require("keymaps")

-- UFO setup
pcall(function()
	require("ufo").setup({
		provider_selector = function(bufnr, filetype, buftype)
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
	})
end)
