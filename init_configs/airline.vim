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
