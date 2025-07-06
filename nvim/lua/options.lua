-- Editor options
vim.opt.background = "dark"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/tmp/backup//")
vim.opt.directory = vim.fn.expand("~/.config/nvim/tmp/swap//")
vim.opt.undodir = vim.fn.expand("~/.config/nvim/tmp/undo//")
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.list = true
vim.g.mapleader = ","
vim.opt.hlsearch = true
vim.opt.compatible = false
vim.cmd([[syntax on]])
vim.cmd([[filetype on]])
vim.cmd([[filetype indent on]])
vim.cmd([[filetype plugin on]])
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "=>   "
vim.opt.termguicolors = true
vim.cmd([[colorscheme base16-tomorrow-night-eighties]])
vim.opt.fillchars:append({ eob = " " })
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

vim.g["test#javascript#jest#executable"] = "npm test --"

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

vim.opt.clipboard:append("unnamedplus")

vim.diagnostic.config({
	float = {
		border = "rounded",
	},
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

-- Folding options
vim.o.foldcolumn = "auto:9"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:,foldclose:]]
