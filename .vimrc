syntax on

filetype plugin indent on

set nocompatible
set number
set showcmd
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
" show match as search proceeds
set incsearch
set t_Co=256
" case insensitive
set ignorecase
" use case if any caps used
set smartcase

set clipboard=unnamed,unnamedplus " Copy into system (*, +_) register

set backspace=2

set foldmethod=indent
autocmd BufRead * normal zR

colorscheme koehler

packloadall "Load all plugins
silent! helptags ALL "Load help file for all plugins

" Manage plugins with vim-plug.
call plug#begin()

Plug 'jiangmiao/auto-pairs'

call plug#end()

set list
set listchars=tab:\|\ ,trail:·
