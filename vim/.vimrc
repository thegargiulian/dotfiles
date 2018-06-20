" Vi IMproved 
set nocompatible

" Plugins
call plug#begin("~/dotfiles/vim/plugged")

Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'

call plug#end()

" plug config

" sneak config
let g:sneak#label = 1
let g:sneak#streak = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

" ale config
let g:ale_linters = {
\   'python': ['flake8'],
\   'R': ['lintr']
\}

" light-line config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized dark',
      \ }

" save on escape
inoremap <Esc> <Esc>:w<CR>

" Backspace 
set backspace=indent,eol,start 

" sets up syntax highlighting
syntax enable

" sets line numbers
set relativenumber number
highlight LineNr ctermfg=grey

" sets tabs to 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" sets parenthetical highlighting to just bold
hi MatchParen cterm=bold ctermbg=Gray ctermfg=none

" sets noexpandtab for Makefiles
if &ft == 'make'
    setlocal noexpandtab
    setlocal tabstop=4
endif

" color columns beyond 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=red guibg=red
