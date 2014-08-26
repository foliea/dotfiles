" Editor options
colorscheme Tomorrow-Night

set background=dark
set guioptions-=r
set guioptions-=L
set number
set ruler

" Temp files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Search
set hlsearch

" Pathogen
execute pathogen#infect()

# Options
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
nmap <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_STORE$']

" Tagbar
nmap <F9> :TagbarToggle<CR>

# Ruby
autocmd FileType ruby compiler ruby

" Custom syntax highlighting
au BufRead,BufNewFile Gomfile setlocal ft=ruby
