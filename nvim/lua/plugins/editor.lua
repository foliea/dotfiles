return {
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
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
		end,
	},

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdate",
		config = function()
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
		end,
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		config = function()
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
		end,
	},

	-- Symbols outline
	{
		"hedyhli/outline.nvim",
		cmd = "Outline",
		config = function()
			require("outline").setup()
		end,
	},

	-- Diagnostics
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		config = function()
			require("trouble").setup({})
		end,
	},

	-- Search and replace
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
	},

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}

