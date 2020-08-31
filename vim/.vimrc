" Vi IMproved
set nocompatible

" Plugins
call plug#begin("~/dotfiles/vim/plugged")

Plug 'justinmk/vim-sneak'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'
Plug 'junegunn/goyo.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" plug config

" R completions remaps
let R_assign_map = '__'

" sneak config
let g:sneak#label = 1
let g:sneak#streak = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

" ale config
let g:ale_linters = {
\   'python': ['flake8'],
\   'R': ['lintr'],
\}

" light-line config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ }

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" save on escape
inoremap <Esc> <Esc>:w<CR>

" backspace
set backspace=indent,eol,start

" sets up syntax highlighting
syntax enable

" sets line numbers
set relativenumber number
highlight LineNr ctermfg=grey

" sets tabs to 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" sets parenthetical highlighting to just bold
hi MatchParen cterm=bold ctermbg=Black ctermfg=none

" sets noexpandtab for Makefiles
if &ft == 'make'
    setlocal noexpandtab
    setlocal tabstop=4
endif

" color columns beyond 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=red guibg=red

" highlighted yank duration
let g:highlightedyank_highlight_duration=750
highlight HighlightedyankRegion ctermbg=228 guibg=#ffff87

" strip white space on :w, for vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" English spell check
set spelllang=en
set spell

" done.
