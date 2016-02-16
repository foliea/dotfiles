call pathogen#infect()
call pathogen#helptags()


set nocompatible "ensures vim over vi
set number
set ruler "add line/column count to the bottom of screen
"syntax on
"
set showmatch "Show matching brackets
syntax enable

set t_Co=256

if $TERM_PROGRAM == "iTerm.app" || has('gui_running')
	set background=dark
	"let g:solarized_termcolors=256
	colorscheme solarized

elseif $TERM_PROGRAM == 'Apple_Terminal'
	"let g:solarized_termcolors = &t_Co
	"let g:solarized_termtrans = 1
	"colorscheme solarized
endif

set noerrorbells visualbell t_vb= "turn off annoying bells
set tags=.tags "destination file for ctags







set autoindent

" Tabs
set noexpandtab

autocmd FileType ruby setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType json setlocal shiftwidth=2 expandtab softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 expandtab softtabstop=2

set tabstop=4 "tabs are 4 space long
set shiftwidth=4

"Settings for C and C++
autocmd FileType c set colorcolumn=80
autocmd FileType c set list
autocmd FileType cpp set colorcolumn=80
autocmd FileType cpp set list

" Temp files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap/
set undodir=~/.vim/tmp/undo//

"List chars
" invisible character setting
" unicode for \u25b8 for `▸', \u00ac for `¬'
set listchars=tab:▸\ ,eol:¬,trail:?,extends:>,precedes:<,nbsp:.

filetype plugin indent on


" NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd vimenter * if !argc() | NERDTree | endif
nmap <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$', '\.pyc$', '\.o$', '\.git']

"let g:NERDTreeDirArrows=0



set splitright "opens new split on the right
set splitbelow "open new vsplit on the bottom

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" Incremental search
set incsearch

highlight Cursor guibg=Green guifg=NONE

" Custom syntax highlighting
au BufRead,BufNewFile Gomfile setlocal ft=ruby
au BufRead,BufNewFile Caskfile setlocal ft=ruby



"Enable neocomplcache at startup, and bind it to the TAB key
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Binding the popup closing to Shift + TAB
inoremap <expr><s-tab>  neocomplcache#close_popup()

"Bind snipMate to the Ctrl + s keystroke
imap <C-S> <Plug>snipMateNextOrTrigger
smap <C-S> <Plug>snipMateNextOrTrigger

"Syntastic runs when opening a file
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"Syntastic configuration for headers
let g:syntastic_cpp_include_dirs = ['inc']
let g:syntastic_c_include_dirs = ['inc', 'inc/libft', '../libft']
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

set clipboard=unnamed
