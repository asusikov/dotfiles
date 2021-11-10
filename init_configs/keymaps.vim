"" Delete to black hole
noremap x "_x
noremap d "_d
nnoremap dd "_dd
noremap D "_D

"" Cut to black hole
noremap c "_c
noremap C "_C

"" Save file
noremap <silent> <leader>sf :w<CR>
noremap <silent> <leader>sa :wa<CR>

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

"" Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc

nnoremap <silent> <leader>pv :vsplit<CR>
nnoremap <silent> <leader>ph :split<CR>

"" Close buffer but not pane
nnoremap <silent> <leader>qf :BD<CR>
"" Close pane
nnoremap <silent> <leader>qp :q<CR>
nnoremap <silent> <leader>qc :pc<CR>
nnoremap <silent> <leader>qa :qa<CR>

map <right> <C-W>l
map <down> <C-W>j
map <up> <C-W>k
map <left> <C-W>h

