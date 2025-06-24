vim.cmd [[
  let g:fzf_install = 'yes | ./install --bin'
  call plug#begin('~/.config/nvim/plugins')
  Plug 'vim-syntastic/syntastic'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdcommenter'
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': g:fzf_install }
  Plug 'jremmen/vim-ripgrep'
  Plug 'janko-m/vim-test'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-system-copy'
  Plug 'Yggdroot/indentline'
  Plug 'chrisbra/Colorizer'
  Plug 'easymotion/vim-easymotion'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
  Plug 'jgdavey/tslime.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'moll/vim-node'
  Plug 'pantharshit00/vim-prisma'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'elzr/vim-json'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'dag/vim-fish'
  Plug 'leafgarland/typescript-vim'
  Plug 'jparise/vim-graphql'
  Plug 'vim-ruby/vim-ruby'
  call plug#end()
]]

-- Editor options
vim.cmd [[colorscheme Tomorrow-Night]]
vim.opt.background = 'dark'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.backupdir = vim.fn.expand('~/.local/share/nvim/tmp/backup//')
vim.opt.directory = vim.fn.expand('~/.local/share/nvim/tmp/swap//')
vim.opt.undodir = vim.fn.expand('~/.local/share/nvim/tmp/undo//')
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Tabs for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ruby', 'eruby', 'crystal', 'yaml', 'haml', 'toml', 'slim', 'json', 'scss', 'css', 'vim', 'javascript', 'typescript', 'groovy' },
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

vim.opt.list = true
vim.g.mapleader = ','
vim.opt.hlsearch = true
vim.opt.compatible = false
vim.cmd [[syntax on]]
vim.cmd [[filetype on]]
vim.cmd [[filetype indent on]]
vim.cmd [[filetype plugin on]]

-- Ruby specific
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    vim.cmd 'compiler ruby'
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>b', "irequire 'pry'; binding.pry<Esc>:w<CR>", { noremap = true, silent = false })
  end
})

vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['typescript_indent_disable'] = 1

-- Filetype detection
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

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '=>   '
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[:%s/\s\+$//e]]
})

vim.api.nvim_set_keymap('n', '<F9>', ':TagbarToggle<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-P>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', ':Rg ""<Left>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':TestVisit<CR>', { noremap = true, silent = true })
vim.g['test#strategy'] = 'tslime'
vim.api.nvim_set_keymap('n', '<leader>c', ':Tmux ""<Left>', { noremap = true })
vim.g['tslime_always_current_session'] = 1

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#fnamemod'] = ':t'
vim.g['airline#extensions#tabline#buffer_nr_show'] = 1

vim.g.fzf_colors = {
  fg = { 'fg', 'Normal' },
  bg = { 'bg', 'Normal' },
  hl = { 'fg', 'Comment' },
  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
  ['hl+'] = { 'fg', 'Statement' },
  info = { 'fg', 'PreProc' },
  border = { 'fg', 'Ignore' },
  prompt = { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker = { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header = { 'fg', 'Comment' },
}

vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { noremap = true })

vim.g.EasyMotion_leader_key = ';'

vim.opt.statusline = vim.opt.statusline:get() .. '%#warningmsg#%{SyntasticStatuslineFlag()}%*'

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_python_checkers = {}

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Custom functions
function Open(target)
  if vim.fn.has('macunix') == 1 then
    vim.fn.system('open ' .. target)
  else
    vim.fn.system('xdg-open ' .. target)
  end
end
_G.Open = Open

function ClearBuffers()
  vim.cmd('w')
  vim.cmd('%bd')
  vim.cmd('e#')
end
vim.api.nvim_create_user_command('B', ClearBuffers, {})

function RenameFile()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name, 'file')
  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.cmd('silent !rm ' .. old_name)
    vim.cmd('redraw!')
  end
end
vim.api.nvim_create_user_command('RF', RenameFile, {})

function DeleteTempFiles()
  vim.fn.system('rm ~/.local/share/nvim/tmp/backup/*')
  vim.fn.system('rm ~/.local/share/nvim/tmp/undo/*')
  vim.fn.system('rm ~/.local/share/nvim/tmp/swap/*')
end
vim.api.nvim_create_user_command('DTF', DeleteTempFiles, {})

function MakeExecutable()
  local filename = vim.fn.expand('%:p')
  vim.fn.system('chmod +x ' .. filename)
end
vim.api.nvim_create_user_command('ME', MakeExecutable, {})
