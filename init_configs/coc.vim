let g:coc_global_extensions = ['coc-solargraph']
nmap <silent> ld <Plug>(coc-definition)
nmap <silent> lr <Plug>(coc-rename)
nmap <silent> lu <Plug>(coc-references)
xmap <silent> la <Plug>(coc-codeaction-selected)
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-tab>'

" imap <C-u> <Plug>(coc-snippets-expand)
" imap <tab> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <cr>
      \ pumvisible() ? coc#_select_confirm() : "\<Tab>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
