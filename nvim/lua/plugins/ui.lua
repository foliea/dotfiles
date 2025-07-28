return {
	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
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
					week_header = { enable = false },
					packages = { enable = false },
					project = { enable = false },
					footer = {},
					shortcut = {},
				},
			})
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local colors = require("config.colors")
			require("lualine").setup({
				options = {
					icons_enabled = true,
					section_separators = "",
					component_separators = "",
					theme = {
						normal = {
							c = { fg = colors.foreground, bg = colors.panel },
							b = { fg = colors.foreground, bg = colors.selection },
							a = { fg = colors.background, bg = colors.blue },
						},
						insert = { a = { fg = colors.background, bg = colors.green } },
						visual = { a = { fg = colors.background, bg = colors.purple } },
						replace = { a = { fg = colors.background, bg = colors.red } },
						inactive = {
							c = { fg = colors.muted, bg = colors.background },
							b = { fg = colors.muted, bg = colors.panel },
							a = { fg = colors.muted, bg = colors.background },
						},
					},
				},
				sections = {
					lualine_b = {
						{ "branch", icon = "" },
						{
							"diff",
							colored = false,
							symbols = { added = " ", modified = " ", removed = " " },
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
		end,
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local colors = require("config.colors")
			require("bufferline").setup({
				options = {
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					separator_style = "slant",
					themable = true,
				},
				highlights = {
					modified = { fg = colors.yellow },
					modified_visible = { fg = colors.yellow },
					modified_selected = { fg = colors.yellow },
					fill = { bg = colors.background_deep },
					separator = { fg = colors.background_deep },
					separator_visible = { fg = colors.background_deep },
					separator_selected = { fg = colors.background_deep },
					tab_separator = { fg = colors.background_deep },
					tab_separator_selected = { fg = colors.background_deep },
					group_label = { fg = colors.background_deep },
					trunc_marker = { bg = colors.background_deep },
					offset_separator = { bg = colors.background_deep },
					group_separator = { bg = colors.background_deep },
				},
			})
		end,
	},

	-- Command line / Notifications
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				routes = {
					{
						filter = {
							any = {
								{ event = "msg_show", find = ":qa" },
								{ event = "notify", find = ":qa" },
							},
						},
						opts = { skip = true },
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"hrsh7th/nvim-cmp",
		},
	},

	-- Smooth scrolling
	{
		"declancm/cinnamon.nvim",
		event = "VeryLazy",
		config = function()
			require("cinnamon").setup({
				disabled = false,
				keymaps = { basic = true, extra = true },
				options = { mode = "window" },
			})
		end,
	},

	-- Color highlighting
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPost",
		config = function()
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
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			local highlight = { "Whitespace", "CursorColumn" }
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
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	-- Colorscheme
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Base16 setup will be handled by highlights.lua
		end,
	},
}
