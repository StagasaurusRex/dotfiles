set background=dark
set number
set splitbelow
set splitright

syntax on

" File Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize=25
augroup ProjectDrawre
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

