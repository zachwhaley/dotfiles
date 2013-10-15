filetype on
filetype plugin on
filetype indent on

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set nosmartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
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
syntax on
colorscheme jellybeans 
hi Search guibg=peru guifg=wheat
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
autocmd FileType c,cpp,java,py autocmd BufWritePre <buffer> :%s/\s\+$//e

" ctags
set tags=./tags,./TAGS,tags;,TAGS;

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ... .->. or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
" OmniCppComplete
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " show function parameters
let OmniCpp_MayCompleteDot=1 " autocomplete after .
let OmniCpp_MayCompleteArrow=1 " autocomplete after ->
let OmniCpp_MayCompleteScope=1 " autocomplete after ::
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / previous window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" setlocal omnifunc=omni#cpp#complete#Main

" highlight member variables
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" status line
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Enhanced keyboard mappings
"
" Exit insert mode
imap ii <ESC>:w<CR>
" Move text at cursor one line down
nmap <C-J> i<CR>
" reverse tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
nmap <Tab> >>
" in normal mode F1 will exit the file
nmap <F2> :qa<CR>
" in normal mode F2 will save the file
nmap <F3> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F3> <ESC>:w<CR>i
" F3 will save and exit the file
nmap <F4> :xa<CR>
imap <F4> <ESC>:xa<CR>
" Toggle the tag list on and off with <F7>
map <F6> :TlistToggle<CR>
" open nerd tree thingy
map <F7> :NERDTreeToggle<CR>
" recreate tags file
map <F9> :!/usr/bin/ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
" goto definition
map <F11> <C-]>
" see definition and declaration
map <F12> g<C-]>
