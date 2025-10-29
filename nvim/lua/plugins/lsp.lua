return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- LSP servers setup using vim.lsp.config (new API)
			vim.lsp.config.ruby_lsp = {}
			vim.lsp.config.ts_ls = {}  
			vim.lsp.config.bashls = {}
			vim.lsp.config.dockerls = {
				on_attach = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			}
			vim.lsp.config.prismals = {}
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			}
			vim.lsp.config.fish_lsp = {}
			vim.lsp.config.terraformls = {}
			vim.lsp.config.jsonls = {}
			vim.lsp.config.eslint = {}
			vim.lsp.config.biome = {
				cmd = { "npx", "biome", "lsp-proxy" },
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
				root_dir = function(fname)
					return vim.fs.root(fname, { "biome.json", "biome.jsonc", ".git" })
				end,
			}

			-- Enable LSP servers
			vim.lsp.enable("ruby_lsp")
			vim.lsp.enable("ts_ls") 
			vim.lsp.enable("bashls")
			vim.lsp.enable("dockerls")
			vim.lsp.enable("prismals")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("fish_lsp")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("eslint")
			vim.lsp.enable("biome")
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
					make = {},
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
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				notify_on_error = false,
			})
		end,
	},
}
