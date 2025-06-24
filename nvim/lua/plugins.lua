-- Plugin management (vim-plug block)
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
  Plug 'chriskempson/base16-vim'
  call plug#end()
]]