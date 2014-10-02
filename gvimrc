" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .gvimrc                                            :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: marin <mravenel@student.42.fr>             +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2014/10/02 10:50:33 by marin             #+#    #+#              "
"    Updated: 2014/10/02 15:04:05 by marin            ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

runtime! stdheader.vim
syntax on
set encoding=utf-8
set number
" Editor options

set guioptions-=r
set guioptions-=L
set number
set ruler

" Temp files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" Tabs
set noexpandtab
set listchars=precedes:<,extends:>,trail:?,tab:>- "tabs characters
autocmd FileType ruby setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType json setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 expandtab softtabstop=2

set tabstop=4 "tabs are 4 space long
set shiftwidth=4

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
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd vimenter * if !argc() | NERDTree | endif
nmap <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\*.DS_STORE$']
"let g:NERDTreeDirArrows=0

" Go
let g:go_disable_autoinstall = 1
let g:go_fmt_fail_silently = 1

" Tagbar
nmap <F9> :TagbarToggle<CR>

" Ruby
autocmd FileType ruby compiler ruby

" Custom syntax highlighting
au BufRead,BufNewFile Gomfile setlocal ft=ruby
au BufRead,BufNewFile Caskfile setlocal ft=ruby


nmap <F6> :set relativenumber!<CR>
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=T  "remove toolbar
set lines=50 columns=120 "default window size
set nolist "display tabs
nmap <F7> :set list!<CR>
set listchars=precedes:<,extends:>,trail:?,tab:>- "tabs characters
set backspace=2 " make backspace work like most other apps
set clipboard=unnamed

"set guifont=DejaVuSansMonoforPowerline
set guifont=Monaco

"""" AIRLINE CONFIG
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
"let g:Powerline_dividers_override = ["\Ue0b0", "\Ue0b1", "\Ue0b2", "\Ue0b3"]
"let g:Powerline_symbols_override = { 'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2" }
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline_left_alt_sep= "\ue0b1"
let g:airline_left_sep = "\ue0b0"
let g:airline_right_sep = "\ue0b2"
let g:airline_right_alt_sep = "\ue0b3"
let g:airline_symbols.branch = "\Ue0a0"
let g:airline_symbols.readonly = "\ue0a2"
let g:airline_symbols.linenr = "\Ue0a1"
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
set noshowmode
set laststatus=2
colorscheme Tomorrow


"add header for 42
function! Header(n)
	if a:n
		execute "Stdheader"
		execute "13"
		if expand("%:e") == "h"
			call s:Add_header()
		endif
	endif
endfunction

function! s:Add_header()
	let name = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! Go" . '#ifndef '. name . "\n". '# define ' . name . "\n". "\n\n\n". '#endif /* !' . name . ' */'
	execute "17"
endfunction

"Uncomment those lines to put the header automatically in each new file
	"autocmd BufWritePre * :%s/\s\+$//e
	"autocmd BufNewFile * call Header(1)