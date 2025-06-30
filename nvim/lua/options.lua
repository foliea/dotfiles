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
vim.opt.fillchars:append({ eob = " " })

vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "@string.special", { fg = "#f99157" })
vim.api.nvim_set_hl(0, "@string.regexp", { fg = "#99cc99" })
vim.api.nvim_set_hl(0, "@string.escape", { fg = "#f99157" })
vim.api.nvim_set_hl(0, "@variable", { fg = "#f2777a" })
vim.api.nvim_set_hl(0, "DevIconRb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconErb", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconConfigRu", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconGemfile", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRake", { fg = "#e8274b" })
vim.api.nvim_set_hl(0, "DevIconRakefile", { fg = "#e8274b" })

vim.g['test#javascript#jest#executable'] = 'npm test --'

if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.opt.clipboard:append('unnamedplus')

vim.diagnostic.config({
  virtual_text = true,
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
