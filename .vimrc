syntax on

filetype plugin indent on

set number
set showcmd
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch

set clipboard=unnamed,unnamedplus " Copy into system (*, +_) register

set backspace=2

set foldmethod=indent
autocmd BufRead * normal zR

colorscheme koehler

packloadall "Load all plugins
silent! helptags ALL "Load help file for all plugins

" Manage plugins with vim-plug.
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" CtrlP
let g:ctrlp_working_path_mode = 'ra' " Starting directory
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

" airline config
let g:airline#extensions#tabline#enabled = 1
