-- Plugin management (vim-plug block)
vim.cmd [[

let g:fzf_install = 'yes | ./install --bin'
  call plug#begin('~/.config/nvim/plugins')
  Plug 'nvimdev/dashboard-nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'scrooloose/nerdcommenter'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'easymotion/vim-easymotion'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'brenoprata10/nvim-highlight-colors'
  Plug 'jgdavey/tslime.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'chriskempson/base16-vim'
  Plug 'rcarriga/nvim-notify'
  Plug 'github/copilot.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'do': 'make tiktoken' }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'stevearc/conform.nvim'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'christoomey/vim-system-copy'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-obsession'
  Plug 'janko-m/vim-test'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'folke/todo-comments.nvim'
  Plug 'nvim-pack/nvim-spectre'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'dag/vim-fish'
  Plug 'elzr/vim-json'
  Plug 'vim-ruby/vim-ruby'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'leafgarland/typescript-vim'
  Plug 'moll/vim-node'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'pantharshit00/vim-prisma'
  Plug 'jparise/vim-graphql'
  call plug#end()
]]
