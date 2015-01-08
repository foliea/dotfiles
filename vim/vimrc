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
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2

set softtabstop=4
set shiftwidth=4
set expandtab

" Show whitespaces
set list

" Leader key
let mapleader=","

" Search
set hlsearch

" Pathogen
execute pathogen#infect()

" Options
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
let NERDTreeIgnore = ['\*.DS_STORE$']

" Go
let g:go_disable_autoinstall = 1
let g:go_fmt_fail_silently = 1

" Tagbar
nmap <F9> :TagbarToggle<CR>

" Ruby
autocmd FileType ruby compiler ruby

" Custom syntax highlighting
autocmd BufRead,BufNewFile Gomfile setlocal ft=ruby
autocmd BufRead,BufNewFile Caskfile setlocal ft=ruby
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Trailing whitespaces
set wrap
set linebreak

" note trailing space at end of next line
set showbreak=>\ \ \

autocmd BufWritePre * :%s/\s\+$//e
