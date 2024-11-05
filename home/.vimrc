set background=dark
set number
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set autochdir
set mouse=v

syntax on

nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>


let g:python3_host_prog = '/usr/local/bin/python3'

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell textwidth=80

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <CR> o<Esc>


noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
