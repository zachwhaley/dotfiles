"" NeoVim Plugins
call plug#begin('~/.config/nvim/plugged')

let g:plug_threads = 8

" Generic plugins
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/a.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme plugins
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git plugins
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Language plugins
Plug 'dag/vim-fish'
Plug 'hashivim/vim-terraform'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'kergoth/vim-bitbake', { 'for': ['bitbake']  }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-liquid'
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'zachwhaley/cscope_macros.vim'
Plug 'zachwhaley/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'fatih/vim-go', { 'for': ['go'] }

call plug#end()


"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""

" Color scheme
let g:solarized_termtrans = 1
let g:solarized_term_italics = 0
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1

" Status line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Sy Source control options
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'

" C++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" Python
let g:python_highlight_all = 1

" Don't map <C-h> to delete pairs
let g:AutoPairsMapCh = 0

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" FZF
set rtp+=/usr/local/opt/fzf

" Terraform
let g:terraform_fmt_on_save = 1

""""""""""""
" Mappings "
""""""""""""

let mapleader=";"

noremap <Leader>+ :tabedit $MYVIMRC<CR>

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
nnoremap <Leader>tn gt
nnoremap <Leader>tp gT
nnoremap <Leader>tt :tabnew<CR>

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

" Open file explorer
nnoremap <C-d> :NERDTreeToggle<CR>

" Tagbar
nnoremap <C-k> :TagbarOpen j<CR>

" FZF
nnoremap <C-p> :FZF<CR>

" Hunk jumping
nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

nnoremap <leader>cd :cd %:p:h<CR>

" coc.nvim GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc.nvim use tab for auto-completion
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""""""""""""
" Settings "
""""""""""""

" I save way too often to need a backup file
set noswapfile
"set nobackup

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

" Wrap lines at 120 chars.
set wrapmargin=160
set textwidth=160

" Show line numbers on
set number

" Show real-time search/replace
set inccommand=nosplit
" Be smart when searching
set ignorecase
set smartcase

" Mouse support
set mouse=a

" Colors
colorscheme gruvbox
set background=dark
set termguicolors

" Fix colors in C/C++ files
if g:colors_name == 'gruvbox'
  highlight! link cString GruvboxPurple
  highlight! link cOperator GruvboxRed
  highlight! link cppOperator GruvboxRed
endif

" Highlight matching braces
set showmatch

" Folding
set foldenable
set foldmethod=syntax
set nofoldenable " don't fold by default"

" Show trailing whitespace and tabs
set list listchars=tab:»\ ,trail:·,nbsp:·,extends:›,precedes:‹

" Don't show preview window
set completeopt-=preview

" Always show sign column
set signcolumn=yes

" auto-change directory to current file's directory
"autocmd BufEnter * silent! lcd %:p:h

" Set HCL as terraform
augroup hcl_ft
  au!
  autocmd BufNewFile,BufRead *.hcl set syntax=terraform
augroup END


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
                 \,xml
            \ setlocal ts=2 sw=2
augroup END
augroup tab_indent
  autocmd!
  autocmd FileType gitcommit
            \ setlocal noexpandtab
augroup END

" Load Cscope
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
