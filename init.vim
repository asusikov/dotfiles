source ~/.config/nvim/init_configs/plug.vim

source ~/.config/nvim/init_configs/basics.vim
source ~/.config/nvim/init_configs/colours.vim
source ~/.config/nvim/init_configs/keymaps.vim
  
lua <<EOF
  require('plugins.luasnip')
  require('plugins.cmp')
  require('plugins.fterm')
  require('plugins.lualine')
  require('plugins.telescope')
  require('plugins.leap')
  require('plugins.codeium_config')
  require('plugins.vimux')
  require('plugins.conform')
  require('plugins.nvim-lint')
EOF

function! s:brew_path()
  if system("uname -m") == "arm64\n"
    return "/opt/homebrew"
  else
    return "/usr/local"
  endif
endfunction

" ---------------
" vim-test
" ---------------
nmap <silent> tr :TestNearest<CR>
nmap <silent> ta :TestFile<CR>
nmap <silent> te :TestLast<CR>
let test#strategy = "vimux"
let test#ruby#rspec#options = '--format documentation'
let test#go#gotest#options = '-v -count=1'

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

" " ---------------
" " scrooloose/nerdtree
" " ---------------
" let NERDTreeShowHidden=1

" " ---------------
" " ale
" " ---------------
" let g:ale_sign_error = '|'
" let g:ale_sign_warning = '|'
" let g:ale_set_highlights = 0
" let g:ale_sign_column_always = 1
" let g:ale_linters_explicit = 1
" let g:ale_disable_lsp = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%severity%][%linter%][%code%] %s'
" " let g:ale_linters = {
" " \   'ruby': ['rubocop'],
" " \   'elixir': ['credo', 'dialyxir'],
" " \   'go': ['golangci-lint']
" " \}
" " let g:ale_fixers = {
" " \   'ruby': ['rubocop'],
" " \   'elixir': ['mix_format'],
" " \   'go': ['gofmt', 'goimports'],
" " \   'json': ['jq'],
" " \   'sql': ['pgformatter'],
" " \   'lua': ['stylua'],
" " \}
" let g:ale_go_golangci_lint_options = '--fast'
" let g:ale_go_gofmt_options = '-s'
" let g:ale_go_goimports_options = "-local $(grep ^module go.mod | awk '{print $2}')"
" let g:ale_fix_on_save = 1
" nmap <leader>af <Plug>(ale_fix)

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
" junegunn/fzf.vim
" ----------------
let fzf_path=s:brew_path()."/opt/fzf"
let &rtp .= ','.fzf_path
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
