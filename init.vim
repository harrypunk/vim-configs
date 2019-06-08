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

colorscheme desert

packloadall "Load all plugins
silent! helptags ALL "Load help file for all plugins

" Manage plugins with vim-plug.
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'

call plug#end()

" Set Eslint as your plugging manager
let g:ale_fixers = {  'javascript': ['eslint']  }
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '!'

" CtrlP
let g:ctrlp_working_path_mode = 'ra' " Starting directory
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

" airline config
let g:airline#extensions#tabline#enabled = 1

" set list
" set listchars=tab:\|\ ,trail:·

" To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" get correct comment highlight of jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
