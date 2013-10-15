filetype plugin on
filetype indent on

" ctags
set tags=./tags,./TAGS,tags;,TAGS;
  
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
" tab width is 4 spaces
set tabstop=4        
" indent also with 4 spaces
set shiftwidth=4     
" expand tabs to spaces
set expandtab        
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
"colorscheme paintbox
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enhanced keyboard mappings
" F1 will exit vim
nmap <F1> :q<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" F3 will save and exit file
nmap <F3> :wq<CR>
imap <F3> <ESC>:wq<CR>
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R .c++-kinds=+p .fields=+iaS .extra=+q .<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
