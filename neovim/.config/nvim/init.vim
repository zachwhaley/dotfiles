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
Plug 'zachwhaley/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zachwhaley/auto-pairs'
Plug 'zachwhaley/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'mhinz/vim-signify'
Plug 'asciidoc/vim-asciidoc'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp'] }
Plug 'zachwhaley/cscope_macros.vim'
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'vim-python/python-syntax', { 'for': ['python'] }

call plug#end()


""""""""""""
" Settings "
""""""""""""

" I save way too often to need a backup file
set noswapfile
set nobackup

" Indenting
set tabstop=4    " tab stop is 4 characters
set shiftwidth=4 " indent also with 4 spaces
set expandtab    " use spaces in place of tabs

"" More intuitive window splitting
set splitright
set splitbelow

" More readable wrapping
set linebreak
set showbreak=↪\ 

" Wrap lines at 95 chars.
set wrapmargin=95
set textwidth=95

" Show line numbers on
set number

" Show real-time search/replace
set inccommand=nosplit
" Be smart when searching
set ignorecase
set smartcase

" Mouse support
set mouse=a

" Dark colorscheme
set background=dark

" Highlight matching braces
set showmatch

" Folding
set nofoldenable " don't fold by default"
set foldmethod=syntax

" Show trailing whitespace and tabs
set list listchars=tab:»\ ,trail:·,nbsp:·,extends:›,precedes:‹

" Don't show preview window
set completeopt-=preview

" Colors
colorscheme solarized

" 2 space indentation
augroup two_space_indent
  autocmd!
  autocmd FileType javascript,coffee
                 \,html,css
                 \,sh,zsh
                 \,proto
                 \,vim
                 \,ruby,eruby
                 \,yaml
            \ setlocal ts=2 sw=2
augroup END

" Always show sign column
highlight SignColumn ctermbg=8
augroup show_sign_column
  autocmd!
  autocmd BufEnter * sign define dummy
  autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


""""""""""""
" Mappings "
""""""""""""

let mapleader=";"

" Natural movement for wrapped lines
noremap k gk
noremap j gj

" Insert mode navigation
inoremap <C-h> <Left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>

" Window navigation
nnoremap <Leader>w <C-w>

" Tab navigation
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>te :tabnew<CR>

" Reverse tab
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

" Terminal mode escape
tnoremap <Esc> <C-\><C-n>

" Open NERDTree
nnoremap <C-n> :NERDTreeToggle %<CR>

" Tagbar
nnoremap <C-m> :TagbarToggle<CR>

" Hunk jumping
nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)


"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""

" Status line
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '

" Sy Source control options
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'

"" Highlights
let g:cpp_class_scope_highlight = 1
let g:python_highlight_all = 1

" Don't map <C-h> to delete pairs
let g:AutoPairsMapCh = 0

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 0
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function() abort
"  return deoplete#close_popup() . "\<CR>"
"endfunction

" deoplete clang
let g:deoplete#sources#clang#executable = '/usr/bin/clang'

" disabled completion from vim-jedi
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<Leader>f"
