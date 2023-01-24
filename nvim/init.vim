call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'ThePrimeagen/harpoon'
Plug 'github/copilot.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader=" "

lua require('jiseung')
