"" Pathogen Vim plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

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
set t_Co=256
set background=dark
colorscheme jellybeans

"" Highlights
set showmatch " highlight matching braces
" highlight member variables
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
au InsertEnter * setlocal cursorline   " while inserting, highlight the current line
au InsertLeave * setlocal nocursorline " while moving, do not highlight the current line

"" wrap lines at 120 chars.
set wrapmargin=120
set textwidth=120

" turn line numbers on
set number

" turn on smart case during searches
set smartcase

" Use the mouse
set mouse=a

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set foldmethod=manual

" Remove trailing whitespace in code files.
autocmd BufWritePre * :%s/\s\+$//e

"" ctags
set tags=./.tags,./.TAGS,.tags;,.TAGS;

"" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"" C++11 for Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"" Keyboard mappings
" Make normal directionals work in Insert Mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
" Move text at cursor one line down
nmap <C-J> i<CR><ESC>
" reverse tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
nmap <Tab> >>

" open nerdtree
map <C-n> :NERDTreeToggle<CR>
" recreate tags file
map <C-F12> :!/usr/bin/ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q -f .tags .<CR>
