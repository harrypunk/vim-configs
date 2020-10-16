syntax on

filetype plugin indent on

set nocompatible
set number
set showcmd
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
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

set foldmethod=manual
" vim backup
set nobackup
set nowritebackup
set noswapfile
set noundofile
set spelllang=en

packloadall "Load all plugins
silent! helptags ALL "Load help file for all plugins

" hide line number in term
autocmd TermOpen * setlocal nonumber norelativenumber

" Manage plugins with vim-plug.
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

call plug#end()

" Set Eslint as your plugging manager
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" CtrlP
let g:ctrlp_working_path_mode = 'a' " Starting directory
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

" airline config
let g:airline#extensions#tabline#enabled = 1

set list
set listchars=tab:\|\ ,trail:·

" To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" get correct comment highlight of jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Map Leader-f to Neoformat
nmap <Leader>f :Neoformat<CR>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
    :tnoremap <A-h> <C-\><C-N><C-w>h
    :tnoremap <A-j> <C-\><C-N><C-w>j
    :tnoremap <A-k> <C-\><C-N><C-w>k
    :tnoremap <A-l> <C-\><C-N><C-w>l
    :inoremap <A-h> <C-\><C-N><C-w>h
    :inoremap <A-j> <C-\><C-N><C-w>j
    :inoremap <A-k> <C-\><C-N><C-w>k
    :inoremap <A-l> <C-\><C-N><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l


" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper', '--lsp'] }
let g:ale_linters ={
      \   'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \}
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
