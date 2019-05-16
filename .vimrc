syntax on

filetype plugin indent on

" Show line number
set number
" Show commands
set showcmd
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
" Highlight search
set hlsearch
set incsearch
set backspace=2

set clipboard=unnamed,unnamedplus " Copy into system (*, +_) register

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
