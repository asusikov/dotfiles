call plug#begin('~/.config/nvim/bundle')

Plug 'nightsense/snow'
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

function! s:brew_path()
  if system("uname -m") == "arm64\n"
    return "/opt/homebrew"
  else
    return "/usr/local"
  endif
endfunction

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
set numberwidth=1
set signcolumn=yes:1
set cursorline
set encoding=UTF-8
set shiftwidth=2
set tabstop=2
set expandtab
set clipboard=unnamed
set timeoutlen=400
set hidden
let mapleader = " "
nnoremap <SPACE> <Nop>

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
noremap <leader>fs :w<CR>

"" Buffer nav
noremap <silent> <Leader>bp :bp<CR>
noremap <silent> <Leader>bn :bn<CR>

noremap <silent> <leader>qq :ccl<CR>
noremap <silent> <leader>qo :botright cwindow 25<CR>

"" Move lines
noremap <silent> <leader>j :m+<CR>
noremap <silent> <leader>k :m-2<CR>

"" Add lines
nnoremap <leader>o o<ESC>
nnoremap <leader><S-o> O<ESC>

"" Break line
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? ':.cc<CR>' : 'i<CR><ESC>'
nnoremap fn :cn<CR>
nnoremap fp :cp<CR>
" nnoremap <C-CR> :.cc<CR>

"" Close buffer but not pane
nnoremap <silent> <leader>fq :BD<CR>
"" Close pane
nnoremap <silent> <leader>pq :q<CR>

"" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc

nnoremap <silent> <leader>pv :vsplit<CR>
nnoremap <silent> <leader>ph :split<CR>

nnoremap <silent> <leader>pc :pc<CR>

" ---------------
" vim-airline
" ---------------
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_skip_empty_sections = 1
let g:airline_section_c = '%f%m'
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L:%v'
let g:airline#extensions#vista#enabled = 0

let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

let g:airline#themes#nord#palette = {}
let g:airline#themes#nord#palette.insert_modified = {
      \ 'airline_c': [ '#2E3440' , '#81A1C1' , 255     , 53      , ''     ] ,
      \ 'airline_x': [ '#2E3440' , '#81A1C1' , 255     , 53      , ''     ] ,
      \ }
let g:airline#themes#nord#palette.normal_modified = g:airline#themes#nord#palette.insert_modified
let g:airline#themes#nord#palette.visual_modified = g:airline#themes#nord#palette.insert_modified

" ---------------
" NERDTree
" ---------------
map <silent> ft :NERDTreeToggle<CR>
map <silent> ff :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" ---------------
" vim-test
" ---------------
nmap <silent> tr :TestNearest<CR>
nmap <silent> ta :TestFile<CR>
nmap <silent> te :TestLast<CR>
let test#strategy = "vimux"
let test#ruby#rspec#options = '--format documentation'

" ---------------
" dispatch.vim
" ---------------
let g:dispatch_quickfix_height = 25

" ---------------
" dash.vim
" ---------------
nmap <silent> <Leader>ds <Plug>DashSearch

" ---------------
" vim-rails
" ---------------
nmap <silent> fa :A<CR>
nmap <silent> fav :AV<CR>

" ---------------
" vim-startify
" ---------------
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

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
map  mf <Plug>(easymotion-bd-f)
nmap mf <Plug>(easymotion-overwin-f)

" ---------------
" vim-wordmotion
" ---------------
let g:wordmotion_prefix = '.'

" ---------------
" ale
" ---------------
let g:ale_sign_error = '|'
let g:ale_sign_warning = '|'
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%][%linter%][%code%] %s'
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'elixir': ['credo', 'dialyxir'],
\   'go': ['golangci-lint']
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'elixir': ['mix_format'],
\   'go': ['gofmt', 'goimports']
\}
let g:ale_go_golangci_lint_options = '--fast --enable-all'
let g:ale_go_goimports_options = "-local $(grep ^module go.mod | awk '{print $2}')"
let g:ale_fix_on_save = 1
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
nmap <silent> ld <Plug>(coc-definition)
nmap <silent> lr <Plug>(coc-rename)
nmap <silent> lu <Plug>(coc-references)
xmap <silent> la <Plug>(coc-codeaction-selected)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_snippet_next = '<c-l>'
let g:coc_snippet_prev = '<c-h>'

imap <C-u> <Plug>(coc-snippets-expand)

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
let fzf_path=s:brew_path()."/opt/fzf"
let &rtp .= ','.fzf_path
nmap <silent> ; :Buffers<CR>
nmap <silent> fl :Files<CR>
let g:fzf_preview_window = []

if !exists('g:fzf_layout')
  let $FZF_DEFAULT_OPTS .= '
    \ --inline-info
    \ --layout=reverse
    \ --no-preview
    \ --color fg:#D8DEE9,bg:#2E3440,hl:#81A1C1,fg+:#D8DEE9,bg+:#2E3440,hl+:#81A1C1,border:#4C566A
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

let g:projectionist_heuristics = {
      \ '*.go': {
      \   '*.go': {
      \       'alternate': '{}_test.go',
      \       'type': 'source'
      \   },
      \   '*_test.go': {
      \       'alternate': '{}.go',
      \       'type': 'test'
      \   },
      \ },
      \ '*.rb': {
      \   'app/*.rb': {
      \       'alternate': 'spec/{dirname}/{basename}_spec.rb',
      \       'type': 'source'
      \   },
      \   'spec/*_spec.rb': {
      \       'alternate': 'app/{dirname}/{basename}.rb',
      \       'type': 'test'
      \   },
      \ }
      \ }


" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" f is for file
let g:which_key_map.f = {
  \ 'name' : '+file',
  \ 'a' : [':A', 'open alternative file'],
  \ 'av' : [':AV', 'open alternative file in horizontal split'],
  \ 's' : [':w', 'save file'],
  \ 'q' : [':BD', 'close file'],
  \ }

" t is for file
let g:which_key_map.t = {
  \ 'name' : '+tests',
  \ 'a' : [':A', 'run all tests in file'],
  \ 'e' : [':AV', 'rerun last test'],
  \ 'r' : [':w', 'run test at current line'],
  \ }

" a is for ale
let g:which_key_map.a = {
  \ 'name' : '+ale',
  \ 'f' : [':ale_fix', 'fix this file'],
  \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
