-- Load keymaps after all plugins are loaded to override plugin keymaps
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
	end,
})

-- Softtab 2
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"ruby",
		"eruby",
		"crystal",
		"yaml",
		"haml",
		"toml",
		"slim",
		"json",
		"scss",
		"css",
		"vim",
		"javascript",
		"typescript",
		"groovy",
	},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Softtab 4
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"fish",
		"dockerfile",
	},
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- Hardtab 4
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"cs",
		"sh",
		"bash",
		"make",
	},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = false
	end,
})

-- Hardtab 8
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
	},
	callback = function()
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 8
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.cmd("compiler ruby")
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>bp",
			"require 'pry'; binding.pry<Esc>:w<CR>",
			{ noremap = true, silent = false }
		)
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Gomfile",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Caskfile",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Gemfile",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Rakefile",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "config.ru",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.es6",
	callback = function()
		vim.bo.filetype = "javascript"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.md",
	callback = function()
		vim.bo.filetype = "markdown"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.docker",
	callback = function()
		vim.bo.filetype = "dockerfile"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.slim",
	callback = function()
		vim.bo.filetype = "slim"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.vim",
	callback = function()
		vim.bo.filetype = "vim"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.avsc",
	callback = function()
		vim.bo.filetype = "json"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "vifmrc",
	callback = function()
		vim.bo.filetype = "vim"
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[:%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
