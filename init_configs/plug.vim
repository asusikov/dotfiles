call plug#begin('~/.config/nvim/bundle')

Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-projectionist'
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-sandwich'

Plug 'easymotion/vim-easymotion'
Plug 'phaazon/hop.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'slim-template/vim-slim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/goyo.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'jpalardy/vim-slime', { 'branch': 'main' }
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-which-key'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'kdheepak/lazygit.nvim'

" Ruby
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'

call plug#end()
