"" Pathogen Vim plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on
set nocompatible

"" Indenting
set nosmartindent " use intelligent indentation for C
set tabstop=4     " tab width is 4 spaces
set shiftwidth=4  " indent also with 4 spaces
set expandtab     " use spaces in place of tabs
" Tabs 2 in JavaScript & HTML
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

"" Colors
set background=dark
colorscheme solarized

"" Highlights
set showmatch " highlight matching braces
" Highlight current line when Inserting
au InsertEnter * setlocal cursorline   " while inserting, highlight the current line
au InsertLeave * setlocal nocursorline " while moving, do not highlight the current line

"" wrap lines at 120 chars.
set wrapmargin=120
set textwidth=120

" turn line numbers on
set number

" turn on smart case during searches
set smartcase
set ignorecase

" Use the mouse
set mouse=a

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set foldmethod=manual

" Remove trailing whitespace in code files.
autocmd BufWritePre * :%s/\s\+$//e

"" ctags
set tags=./.tags,./.TAGS,.tags;,.TAGS;

"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"" Keyboard mappings
" Make normal directionals work in Insert Mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" Window Navigation
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>
imap <silent> <S-Up> :wincmd k<CR>
imap <silent> <S-Down> :wincmd j<CR>
imap <silent> <S-Left> :wincmd h<CR>
imap <silent> <S-Right> :wincmd l<CR>
" Move text at cursor one line down
nmap <C-J> i<CR><ESC>
" reverse tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
nmap <Tab> >>
" A touch of Emacs
imap <C-a> <Home>
imap <C-e> <End>
nmap <C-a> <Home>
nmap <C-e> <End>

" open nerdtree
map <C-n> :NERDTreeToggle<CR>
" recreate tags file
map <C-F12> :!/usr/bin/ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q -f .tags .<CR>
