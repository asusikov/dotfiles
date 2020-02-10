call plug#begin('~/.config/nvim/bundle')

Plug 'nightsense/snow'
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'slim-template/vim-slim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'chaoren/vim-wordmotion'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
" Plug 'fishbullet/deoplete-ruby'
" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'

Plug 'elixir-editors/vim-elixir'

call plug#end()

" ---------------
" basics
" ---------------
set t_md=
syntax on
set termguicolors
colorscheme nord
set noerrorbells
set novisualbell
set number
set cursorline
set t_Co=256
set encoding=UTF-8
set shiftwidth=2
set tabstop=2
set expandtab 	
set clipboard=unnamed
let mapleader = ","

" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"" Delete to black hole 
noremap x "_x
noremap d "_d
nnoremap dd "_dd
noremap D "_D

"" Cut to black hole
noremap c "_c
noremap C "_C

"" Save file
noremap <leader>s :w<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Close buffer
" noremap <leader>c :bd<CR>

"" Move lines
noremap <leader>j :m+<CR>
noremap <leader>k :m-2<CR>

"" Add lines
nnoremap <leader>o o<ESC>
nnoremap <leader><S-o> O<ESC>

"" Break line
nnoremap <CR> i<CR><ESC>

"" Close buffer but not pane
nnoremap <leader>c :b#<bar>bd#<CR>

" ---------------
" vim-airline
" ---------------
" let g:airline_theme='snow_dark'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_section_b = '%{FugitiveStatusline()}'
" Just show the file name
let g:airline_section_c = '%F%m'
let g:airline_section_z = ''
"let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'

" ---------------
" NERDTree
" ---------------
map <silent> <Leader>n :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" ---------------
" vim-test
" ---------------
nmap <silent> <Leader>r :TestNearest<CR>
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>e :TestLast<CR>
let test#strategy = "dispatch"

" ---------------
" dash.vim 
" ---------------
nmap <silent> <leader>d <Plug>DashSearch

" ---------------
" vim-rails
" ---------------
nmap <silent> <Leader>a :A<CR>

" ---------------
" vim-startify
" ---------------
let g:startify_change_to_vcs_root = 1

" ---------------
" ack.vim
" ---------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ---------------
" goyo
" ---------------
let g:goyo_width = 120
let g:goy_height = 100
nmap <silent> <leader>g :Goyo<CR>

" ---------------
" deoplete.nvim
" ---------------
let g:deoplete#enable_at_startup = 1

" ---------------
" scrooloose/nerdcommenter
" ---------------
" let g:NERDSpaceDelims = 1

" ---------------
" scrooloose/nerdtree
" ---------------
let NERDTreeShowHidden=1

" ---------------
" vim-easymotion
" ---------------
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget

" ---------------
" vim-wordmotion
" ---------------
let g:wordmotion_prefix = '.'

" ---------------
" ale
" ---------------
let g:ale_sign_error = '~~'
let g:ale_sign_warning = '~~'
