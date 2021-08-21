call plug#begin(stdpath('data') . '/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'sgur/vim-editorconfig'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ms-jpq/chadtree', { 'on': ['CHADopen', 'CHADdeps'], 'branch': 'chad', 'do': 'python3 -m chadtree deps' }

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

set list
set listchars=tab:▸\ ,eol:¬

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

" CHADtree customizations
lua << EOF
vim.api.nvim_set_var("chadtree_settings", {
  ["keymap.primary"] = {"o"},
  ["keymap.tertiary"] = {"t"},
  ["keymap.v_split"] = {"v"},
  ["keymap.h_split"] = {"s"},
  ["keymap.open_sys"] = {},
  ["keymap.select"] = {},
  ["keymap.delete"] = {},
  ["keymap.trash"] = {},
  ["keymap.clear_selection"] = {},
  ["options.session"] = false,
  ["theme.icon_glyph_set"] = "ascii"
})
EOF
nnoremap <leader>t <cmd>CHADopen<cr>

" Enable Deoplete
let g:deoplete#enable_at_startup = 1

if filereadable($HOME . "/.config/nvim/locals.vim")
  source $HOME/.config/nvim/locals.vim
endif
