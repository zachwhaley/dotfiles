runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set nosmartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
" Tabs 2 in JavaScript & HTML
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
set expandtab        " use spaces in place of tabs
set smarttab
" make tabs readable when viewed
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set wrapmargin=120
set textwidth=120
" turn syntax highlighting on
set background=dark
set t_Co=256
colorscheme jellybeans
" turn line numbers on
set number
" turn on smart case during searches
set ignorecase
set smartcase
" don't highlight the previous search term
set nohls
" highlight search results
set incsearch
" show cursor position at all times
set ruler
" set the mouse to highlight things correctly
set mouse=a
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Omni completion autocomplete tool for C programming
set foldmethod=manual

" Remove trailing whitespace in code files.
autocmd BufWritePre * :%s/\s\+$//e

" ctags
set tags=./.tags,./.TAGS,.tags;,.TAGS;

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ... .->. or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
" OmniCppComplete
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " show function parameters
let OmniCpp_MayCompleteDot=1 " autocomplete after
let OmniCpp_MayCompleteArrow=1 " autocomplete after
let OmniCpp_MayCompleteScope=1 " autocomplete after
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / previous window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" C++11 for Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" highlight member variables
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

au InsertEnter * setlocal cursorline
au InsertLeave * setlocal nocursorline

" status line
set laststatus=2
"help file flag
set statusline=%h
"modified flag
set statusline+=%m
"read only flag
set statusline+=%r
"filetype
set statusline+=%y
"tail of the filename
set statusline+=\ %t
"left/right separator
set statusline+=%=
" Current line
set statusline+=%l
" Separator
set statusline+=/
" Total lines`
set statusline+=%L

" Enhanced keyboard mappings
"
" Exit insert mode
" Ctrl-[ is the same as Esc
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
" Toggle the tag list on and off with <F7>
map <F6> :TlistToggle<CR>
" open nerd tree thingy
map <C-n> :NERDTreeToggle<CR>
" recreate tags file
map <F9> :!/usr/bin/ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q -f .tags .<CR>
" goto definition
map <F11> <C-]>
" see definition and declaration
map <F12> g<C-]>
