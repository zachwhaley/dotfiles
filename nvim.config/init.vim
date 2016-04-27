"" NeoVim Plugins
call plug#begin('~/.config/nvim/plugged')

let g:plug_threads = 8
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'scrooloose/nerdcommenter'
Plug 'uarun/vim-protobuf'
Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zachwhaley/auto-pairs'
Plug 'zachwhaley/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'mhinz/vim-signify'
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'asciidoc/vim-asciidoc'
Plug 'nfvs/vim-perforce'

call plug#end()

"" I save way too often to need a backup file
set noswapfile
set nobackup

"" Indenting
set nosmartindent " use intelligent indentation for C
set tabstop=4     " tab width is 4 spaces
set shiftwidth=4  " indent also with 4 spaces
set expandtab     " use spaces in place of tabs
" 2 space tabs
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype bash setlocal ts=2 sts=2 sw=2
autocmd Filetype proto setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2

"" Colors
set t_Co=256
set background=dark
colorscheme solarized
highlight SignColumn ctermbg=8

set splitright
set splitbelow

" Status line
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
" Always show sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Sy Source control options
" let g:signify_sign_overwrite = 1
let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'

"" Highlights
set showmatch " highlight matching braces
let g:cpp_class_scope_highlight = 1
let python_highlight_all = 1
" Highlight current line when Inserting
au InsertEnter * setlocal cursorline   " while inserting, highlight the current line
au InsertLeave * setlocal nocursorline " while moving, do not highlight the current line

"" wrap lines at 95 chars.
set wrapmargin=95
set textwidth=95
set colorcolumn=95
highlight ColorColumn ctermbg=0

" turn line numbers on
set number

" turn on smart case during searches
set smartcase
set ignorecase

" Folding
set nofoldenable "Don't fold by default"
set foldmethod=syntax

" Show trailing whitespace and tabs
set list listchars=tab:▸\ ,trail:·,nbsp:*

"" cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

set completeopt=menuone,menu,longest,preview

"" Keyboard mappings
" <leader> is ";"
let mapleader=";"
set wildmode=list:longest,full

" Make normal directionals work in Insert Mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" Hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" Window Navigation
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
" Tab Navigation
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
" reverse tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <Esc><<i
nnoremap <Tab> >>
" Yank to end of line
nnoremap Y y$
" A touch of Emacs
inoremap <C-a> <Esc>I
inoremap <C-e> <End>
nnoremap <C-a> ^
nnoremap <C-e> <End>
vnoremap <C-a> ^
vnoremap <C-e> $

" open nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
" CtrlP
nmap <C-p> :CtrlP<CR>
