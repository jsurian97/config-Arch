let g:user42 = 'jsurian42'
let g:mail42 = 'jsurian@student.42lausanne.ch'
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
syntax on
colorscheme industry
"highlight Comment ctermfg=DarkGreen guifg=#559955
set hlsearch
set incsearch
"set cursorline
"highlight CursorLine ctermbg=235
highlight CurSearch ctermfg=darkred ctermbg=black guifg=#ffffff guibg=#000000
"fenetre lexplore
function! MyLexplore()
  let l:old_size = g:netrw_winsize
  let g:netrw_winsize = 10
  let g:netrw_liststyle = 3
  Lexplore
  let g:netrw_winsize = l:old_size
endfunction

command! Lex call MyLexplore()

nnoremap <A-h> :vertical resize -5<CR>
nnoremap <A-l> :vertical resize +5<CR>
nnoremap <A-j> :resize +3<CR>
nnoremap <A-k> :resize -3<CR>
