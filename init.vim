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

call plug#end()

" Set Eslint as your plugging manager
let g:ale_fixers = {  'javascript': ['eslint']  }
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'

" CtrlP
let g:ctrlp_working_path_mode = 'ra' " Starting directory
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

" airline config
let g:airline#extensions#tabline#enabled = 1

set list
set listchars=tab:\|\ ,trail:·

" To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" get correct comment highlight of jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" To have Neoformat run Prettier on save:
autocmd BufWritePre *.js,*.yaml,*.yml Neoformat prettier
autocmd BufWritePre *.hs Neoformat brittany


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

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" haskell-ide-engine
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
highlight link ALEError Error
highlight Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
highlight link ALEWarning Warning
highlight link ALEInfo SpellCap
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
