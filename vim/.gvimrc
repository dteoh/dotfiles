filetype off
filetype plugin indent on

set modelines=0

set nocompatible
set autoindent
set smartindent
set showmatch
set showmode
set showcmd
set cursorline
set number
set ruler

set list
set listchars=tab:▸\ ,eol:¬

set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

au FocusLost * :wa

"set guifont=Monaco:h14
set go-=T
set bg=dark
let g:molokai_original = 1
set t_Co=256
colorscheme molokai
