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

-- Clipboard integration for vim-system-copy in WSL, Wayland, X11, and VS Code
if vim.fn.has('wsl') == 1 then
  vim.g['system_copy#copy_command'] = 'clip.exe'
  vim.g['system_copy#paste_command'] = "powershell.exe -NoLogo -NoProfile -Command \"[Console]::Write((Get-Clipboard -Raw) -replace '\r', '')\""
elseif vim.fn.has('macunix') == 1 then
  vim.g['system_copy#copy_command'] = 'pbcopy'
  vim.g['system_copy#paste_command'] = 'pbpaste'
elseif vim.g['vscode'] ~= nil then
  vim.g['system_copy#copy_command'] = ''
  vim.g['system_copy#paste_command'] = ''
elseif vim.fn.executable('wl-copy') == 1 then
  vim.g['system_copy#copy_command'] = 'wl-copy'
  vim.g['system_copy#paste_command'] = 'wl-paste'
elseif vim.fn.executable('xclip') == 1 then
  vim.g['system_copy#copy_command'] = 'xclip -selection clipboard'
  vim.g['system_copy#paste_command'] = 'xclip -selection clipboard -o'
elseif vim.fn.executable('xsel') == 1 then
  vim.g['system_copy#copy_command'] = 'xsel --clipboard --input'
  vim.g['system_copy#paste_command'] = 'xsel --clipboard --output'
end