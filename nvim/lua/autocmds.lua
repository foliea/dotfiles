-- Autocommands
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ruby', 'eruby', 'crystal', 'yaml', 'haml', 'toml', 'slim', 'json', 'scss', 'css', 'vim', 'javascript', 'typescript', 'groovy', 'lua' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cs',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    vim.cmd 'compiler ruby'
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>b', "irequire 'pry'; binding.pry<Esc>:w<CR>", { noremap = true, silent = false })
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Gomfile',
  callback = function() vim.bo.filetype = 'ruby' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Caskfile',
  callback = function() vim.bo.filetype = 'ruby' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.es6',
  callback = function() vim.bo.filetype = 'javascript' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function() vim.bo.filetype = 'markdown' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.docker',
  callback = function() vim.bo.filetype = 'dockerfile' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.slim',
  callback = function() vim.bo.filetype = 'slim' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.vim',
  callback = function() vim.bo.filetype = 'vim' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.avsc',
  callback = function() vim.bo.filetype = 'json' end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'vifmrc',
  callback = function() vim.bo.filetype = 'vim' end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[:%s/\s\+$//e]]
})
