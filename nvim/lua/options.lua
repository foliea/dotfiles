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
vim.opt.fillchars:append({ eob = " " })

-- Disable mouse menu items
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-2-]])

-- Add mise to PATH (for lsp servers)
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Test runners configuration
vim.g["test#javascript#jest#executable"] = "npm test --"
vim.g["test#basic#start_normal"] = 1

-- Clipboard configuration
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

-- Diagnostics styling
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
