-- LSP and completion setup
pcall(function()
	local lspconfig = require("lspconfig")

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
				diagnostics = {
					globals = { "vim" },
				},
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
end)

pcall(function()
	require("copilot").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end)

pcall(function()
	require("copilot_cmp").setup()
end)

pcall(function()
	local lspkind = require("lspkind")

	lspkind.init({
		symbol_map = {
			Copilot = " ",
		},
	})
	local cmp = require("cmp")

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
				maxwidth = {
					menu = 50,
					abbr = 50,
				},
				ellipsis_char = "...",
				show_labelDetails = true,
				before = function(_, vim_item)
					return vim_item
				end,
			}),
		},
		window = {
			completion = {
				border = "rounded",
			},
			documentation = {
				border = "rounded",
				winhighlight = "Normal:CmpDocNormal",
			},
		},
	})
end)
