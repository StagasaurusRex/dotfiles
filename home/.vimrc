set background=dark
set number
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set autochdir

syntax on

nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" File Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize=20

augroup ProjectDrawrer
  autocmd!
  autocmd VimEnter * :Vexplore
  autocmd VimEnter * wincmd l 
augroup END

aug netrw_close
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell textwidth=80

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <CR> o<Esc>
