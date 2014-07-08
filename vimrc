" Editor options
colorscheme Tomorrow-Night
set guioptions-=r
set guioptions-=L
set number
set list

" Temp files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>
