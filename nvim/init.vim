call plug#begin(stdpath('data') . '/plugged')

Plug 'gpanders/editorconfig.nvim'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'

if filereadable($HOME . "/.config/nvim/plugins.vim")
  source $HOME/.config/nvim/plugins.vim
endif

call plug#end()

filetype on

set modelines=0

set showmode
set smartindent
set showmatch
set cursorline
set number

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set textwidth=79
set colorcolumn=+6

set scrolloff=3

set mouse=a

set wildmode=list:longest,full

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

" Easier copying to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Removes trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Can use Tab to navigate popup completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-sneak customizations
let g:sneak#s_next = 1

if filereadable($HOME . "/.config/nvim/config.lua")
  luafile $HOME/.config/nvim/config.lua
endif

if filereadable($HOME . "/.config/nvim/locals.vim")
  source $HOME/.config/nvim/locals.vim
endif
