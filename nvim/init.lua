vim.cmd [[
  let g:fzf_install = 'yes | ./install --bin'
  call plug#begin('~/.config/nvim/plugins')
  Plug 'vim-syntastic/syntastic'
  Plug 'neovim/nvim-lspconfig'
  Plug 'scrooloose/nerdcommenter'
  Plug 'majutsushi/tagbar'
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
  Plug 'github/copilot.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'do': 'make tiktoken' }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'folke/todo-comments.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
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

vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':TestVisit<CR>', { noremap = true, silent = true })
vim.g['test#strategy'] = 'tslime'
vim.api.nvim_set_keymap('n', '<leader>c', ':Tmux ""<Left>', { noremap = true })
vim.g['tslime_always_current_session'] = 1

vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { noremap = true })

vim.g.EasyMotion_leader_key = ';'

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_python_checkers = {}

-- Native LSP keymaps
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

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

-- CopilotChat.nvim setup
pcall(function()
  require("CopilotChat").setup {
    model = "gpt-4.1"
  }
end)

-- Telescope ui-select setup
pcall(function()
  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        }
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }
  require("telescope").load_extension("ui-select")
  require("telescope").load_extension("fzf")
end)

-- Treesitter setup for better syntax highlighting
pcall(function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end)

-- Gitsigns setup
pcall(function()
  require('gitsigns').setup()
end)

-- NvimTree setup
pcall(function()
  require('nvim-tree').setup()
end)

pcall(function()
  require("todo-comments").setup()
end)

pcall(function()
  require("trouble").setup {}
end)

-- Lualine setup (after plugin block)
pcall(function()
  require('lualine').setup {
    options = {
      theme = 'auto',
      icons_enabled = true,
      section_separators = '',
      component_separators = '',
    },
    -- You can customize sections/components here
  }
end)

-- Bufferline setup
vim.opt.termguicolors = true

pcall(function()
  require("bufferline").setup{
    options = {
      show_buffer_icons = true, -- enable filetype icons
      show_buffer_close_icons = true,
      show_close_icon = true,
      separator_style = "slant", -- looks modern with icons
    }
  }
end)

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tq', ":TodoTelescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xx', "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })

-- LSP setup (replace coc.nvim)
pcall(function()
  local lspconfig = require('lspconfig')
  lspconfig.ts_ls.setup{}
  lspconfig.lua_ls.setup{}
  lspconfig.solargraph.setup{}
  lspconfig.bashls.setup{}
  lspconfig.dockerls.setup{}
end)

pcall(function()
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    })
  })
end)