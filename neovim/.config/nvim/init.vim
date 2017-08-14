"" NeoVim Plugins
call plug#begin('~/.config/nvim/plugged')

let g:plug_threads = 8

Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'uarun/vim-protobuf'
Plug 'altercation/vim-colors-solarized'
Plug 'zachwhaley/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zachwhaley/auto-pairs'
Plug 'zachwhaley/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'mhinz/vim-signify'
Plug 'asciidoc/vim-asciidoc'
Plug 'aliva/vim-fish'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'tweekmonster/deoplete-clang2'
Plug 'chazy/cscope_maps'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'vim-python/python-syntax'
Plug 'udalov/kotlin-vim'
Plug 'kchmck/vim-coffee-script'

call plug#end()

"" I save way too often to need a backup file
set noswapfile
set nobackup

"" Indenting
set tabstop=4     " tab width is 4 spaces
set shiftwidth=4  " indent also with 4 spaces
set expandtab     " use spaces in place of tabs
" 2 space tabs
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype bash setlocal ts=2 sts=2 sw=2
autocmd Filetype proto setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
" Tab tabs
autocmd Filetype go setlocal noet nolist

"" Colors
set background=dark
colorscheme solarized
highlight SignColumn ctermbg=8

" More intuitive window splitting
set splitright
set splitbelow

" More readable wrapping
set linebreak

" Cool Neovim feature that shows real-time search/replace
set inccommand=nosplit

" Mouse support
set mouse=a

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
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'

"" Highlights
set showmatch " highlight matching braces
let g:cpp_class_scope_highlight = 1
let g:python_highlight_all = 1
" Change cursor when inserting
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"" wrap lines at 95 chars.
set wrapmargin=95
set textwidth=95

" Don't map <C-h> to delete pairs
let g:AutoPairsMapCh = 0

" turn line numbers on
set number

" turn on smart case during searches
set smartcase
set ignorecase

" Folding
set nofoldenable "Don't fold by default"
set foldmethod=syntax

" Show trailing whitespace and tabs
set showbreak=↪\ 
set list lcs=tab:»\ ,trail:·,nbsp:·,extends:›,precedes:‹

" Tags
set tags=tags;/

" Cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
"au BufEnter /* call LoadCscope()

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

set completeopt-=preview

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 0
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" deoplete clang
let g:deoplete#sources#clang#executable = '/usr/bin/clang'

" disabled completion from vim-jedi
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>f"

"" Keyboard mappings
" <leader> is ";"
let mapleader=";"
set wildmode=list:longest,full

" Open NERDTree
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
nnoremap <C-n> :NERDTreeToggle %<CR>

" Tagbar
nnoremap <C-m> :TagbarToggle<CR>

" Terminal Mode
tnoremap <Esc> <C-\><C-n>

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
nnoremap <leader>te :tabnew<CR>
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
