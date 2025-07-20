return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- LSP servers setup
			lspconfig.ruby_lsp.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.dockerls.setup({
				on_attach = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
			lspconfig.prismals.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
			lspconfig.fish_lsp.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.eslint.setup({})
			lspconfig.biome.setup({
				cmd = { "npx", "biome", "lsp-proxy" },
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
				root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc", ".git"),
			})
		end,
	},

	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	-- Copilot completion source
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			lspkind.init({
				symbol_map = { Copilot = " " },
			})

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-N>"] = cmp.mapping.select_next_item(),
					["<C-P>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = { menu = 50, abbr = 50 },
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(_, vim_item)
							return vim_item
						end,
					}),
				},
				window = {
					completion = { border = "rounded" },
					documentation = {
						border = "rounded",
						winhighlight = "Normal:CmpDocNormal",
					},
				},
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
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
		end,
	},
}
