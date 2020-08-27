call plug#begin('~/.config/nvim/bundle')

Plug 'nightsense/snow'
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'jpalardy/vim-slime'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'

" Elixir
" Plug 'elixir-editors/vim-elixir'

" Go
" Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

" ---------------
" basics
" ---------------
let g:nord_bold = 0
set t_md=
syntax on
set termguicolors
colorscheme nord
set noerrorbells
set novisualbell
set number
set cursorline
set encoding=UTF-8
set shiftwidth=2
set tabstop=2
set expandtab
set clipboard=unnamed
set timeoutlen=200
set hidden
let mapleader = ","

noremap <silent> ht :noh<CR>

hi Statement gui=NONE
hi MoreMsg gui=NONE
hi ModeMsg cterm=NONE gui=NONE

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
noremap <silent> BP :bp<CR>
noremap <silent> BN :bn<CR>

noremap <silent> <leader>qf :ccl<CR>

"" Move lines
noremap <leader>j :m+<CR>
noremap <leader>k :m-2<CR>

"" Add lines
nnoremap <leader>o o<ESC>
nnoremap <leader><S-o> O<ESC>

"" Break line
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? ':.cc<CR>' : 'i<CR><ESC>'
nnoremap fn :cn<CR>
nnoremap fp :cp<CR>
" nnoremap <C-CR> :.cc<CR>

"" Close buffer but not pane
nnoremap <leader>w :BD<CR>

"" Replace selected text 
vnoremap <C-r> "hy:%s/<C-r>h//gc

nnoremap sv :vsplit<CR>  

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
let g:airline_skip_empty_sections = 1
let g:airline_section_b = ''
let g:airline_section_c = '%F%m'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline#extensions#vista#enabled = 0

" ---------------
" NERDTree
" ---------------
map <silent> tt :NERDTreeToggle<CR>
map <silent> tf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" ---------------
" vim-test
" ---------------
nmap <silent> <Leader>r :TestNearest<CR>
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>e :TestLast<CR>
let test#strategy = "dispatch"
let test#ruby#rspec#options = '--format documentation'

" ---------------
" dispatch.vim
" ---------------
let g:dispatch_quickfix_height = 25

" ---------------
" dash.vim
" ---------------
nmap <silent> ds <Plug>DashSearch

" ---------------
" vim-rails
" ---------------
nmap <silent> ra :A<CR>
nmap <silent> RA :AV<CR>

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
nmap <silent> gt :Goyo<CR>

" ---------------
" scrooloose/nerdtree
" ---------------
let NERDTreeShowHidden=1

" ---------------
" vim-easymotion
" ---------------
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget
nmap mw <Plug>(easymotion-w)
nmap me <Plug>(easymotion-e)
nmap mb <Plug>(easymotion-b)

" ---------------
" vim-wordmotion
" ---------------
let g:wordmotion_prefix = '.'

" ---------------
" ale
" ---------------
let g:ale_sign_error = '~~'
let g:ale_sign_warning = '~~'
let g:ale_set_highlights = 0
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'elixir': ['credo', 'dialyxir'],
\}
let g:ale_fixers = { 'ruby': ['rubocop'], 'elixir': ['mix_format'] } 
nmap <leader>af <Plug>(ale_fix)

" ---------------
" ctrlsf
" ---------------
nmap <C-F>i <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordExec
vmap <C-F>F <Plug>CtrlSFVwordPath
nmap <C-F>f <Plug>CtrlSFCwordExec
nmap <C-F>F <Plug>CtrlSFCwordPath
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }

" ----------------
" coc.nvim
" ----------------
let g:coc_global_extensions = ['coc-solargraph']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ----------------
" liuchengxu/vista.vim
" ----------------
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 70
let g:vista_echo_cursor = 0
let g:vista_close_on_jump = 1
nmap <silent> vf :Vista finder<CR>
nmap <silent> vo :Vista<CR>

" ----------------
" junegunn/fzf.vim 
" ----------------
set rtp+=/usr/local/opt/fzf
nmap <silent> ; :Buffers<CR>
nmap <silent> <C-p> :Files<CR>

if !exists('g:fzf_layout')
  let $FZF_DEFAULT_OPTS .= '
    \ --inline-info
    \ --color fg:#D8DEE9,bg:#2E3440,hl:#81A1C1,fg+:#D8DEE9,bg+:#2E3440,hl+:#81A1C1
    \ --color pointer:#81A1C1,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" ----------------
" jpalardy/vim-slime 
" ----------------
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
