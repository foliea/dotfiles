-- Editor options
vim.opt.background = 'dark'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.backupdir = vim.fn.expand('~/.config/nvim/tmp/backup//')
vim.opt.directory = vim.fn.expand('~/.config/nvim/tmp/swap//')
vim.opt.undodir = vim.fn.expand('~/.config/nvim/tmp/undo//')
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.list = true
vim.g.mapleader = ','
vim.opt.hlsearch = true
vim.opt.compatible = false
vim.cmd [[syntax on]]
vim.cmd [[filetype on]]
vim.cmd [[filetype indent on]]
vim.cmd [[filetype plugin on]]
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '=>   '
vim.opt.termguicolors = true
vim.cmd [[colorscheme base16-tomorrow-night-eighties]]