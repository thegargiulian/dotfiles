" Vi IMproved 
set nocompatible

" Plugins
call plug#begin("~/dotfiles/vim/plugged")

Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter' 
"Plug 'SirVer/ultisnips'
"Plug 'roxma/nvim-completion-manager'
"Plug 'jalvesaq/Nvim-R'
"Plug 'gaalcaras/ncm-R'

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
      \ }

" ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" save on escape
inoremap <Esc> <Esc>:w<CR>

" backspace 
set backspace=indent,eol,start 

" setting up completion
"let g:cm_smart_enable = 1
"inoremap <expr> <Tab> pumvisible() ? \"\<C-n>" : \"\<Tab>"

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

" English spellcheck
set spelllang=en
set spell
