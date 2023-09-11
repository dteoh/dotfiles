call plug#begin(stdpath('data') . '/plugged')

Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'nmac427/guess-indent.nvim'

if filereadable($HOME . "/.config/nvim/plugins.vim")
  source $HOME/.config/nvim/plugins.vim
endif

call plug#end()

if filereadable($HOME . "/.config/nvim/config.lua")
  luafile $HOME/.config/nvim/config.lua
endif
if filereadable($HOME . "/.config/nvim/locals.lua")
  luafile $HOME/.config/nvim/locals.lua
endif

if filereadable($HOME . "/.config/nvim/locals.vim")
  source $HOME/.config/nvim/locals.vim
endif
