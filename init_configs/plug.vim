call plug#begin('~/.config/nvim/bundle')

Plug 'arcticicestudio/nord-vim'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'slim-template/vim-slim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'liuchengxu/vista.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'jpalardy/vim-slime', { 'branch': 'main' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'uml']}
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-which-key'

" Ruby
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'

" Elixir
" Plug 'elixir-editors/vim-elixir'

" Rust
" Plug 'rust-lang/rust.vim'

" Plug 'fatih/vim-go'

call plug#end()
