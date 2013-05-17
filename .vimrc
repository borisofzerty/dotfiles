" Boris's vimrc
set number              " line numbers
set ruler               " current posizion in corner
set showcmd             " show the command you are typing
syntax on               " syntax highlight enabled
set modeline            " allow modeline ( /* vim: set sw=2: */ )
"autocmd WinLeave * set nocursorcolumn   " set current column highlight
"autocmd WinEnter * set cursorcolumn     " only in current buffer
"set cursorcolumn
set colorcolumn=80
set cursorline
"set list                " end of line and trailing spaces visibility
set listchars=trail:¤,tab:>-,eol:.
" if terminal allow funny coloring, use them all!
if $TERM == "xterm" || $TERM == "screen-256color"
    set t_Co=256
    colorscheme bubblegum
else
    colorscheme desert
endif

"set hlsearch            " highlight searchs
set ignorecase          " search is not case sensitive

set tabstop=4           " 4 spaces for a tab
set shiftwidth=4
set softtabstop=4
set expandtab           " use spaces, not tabs
set splitbelow          " split in a logic way
set splitright          " split in a logic way
set mouse=a             " enable mouse

set autoindent          " automatic indentation
set exrc                " enable local .exrc file
set noswapfile          " no .%.swp
au BufWritePre * %s/\s\+$//e    "kill trailing spaces at save
" sessions, use :mksession to create new one
set sessionoptions=blank,buffers,curdir,help,options,resize,winsize
set wildmenu                " autocomplete suggestion menu
set wildmode=longest:full   " autocomplete term style

" mapping
let mapleader = "é"

cmap <Leader><Leader>  
imap <Leader><Leader>  
map <Leader><Leader> 
vmap <Leader><Leader>  

map <Leader>O Oj
map <Leader>o ok
map <Leader>h :set hlsearch!
map <Leader>l :set list!
map <Leader>w :w
map <Leader>W :wall
map <Leader>. :
map <Leader>r :registers
map <Leader>m :marks
map <Leader>j :jumps
" window resize: leader, [shift] + arrows
map <leader>OC :vertical resize +5
map <leader>OD :vertical resize -5
map <leader>[1;2C :vertical resize +1
map <leader>[1;2D :vertical resize -1
map <leader>OA :resize +5
map <leader>OB :resize -5
map <leader>[1;2A :resize +1
map <leader>[1;2B :resize -1

vmap <Leader>c :s,^,//,
vmap <Leader>C :s,^//,,
vmap <Leader>l <gv
vmap <Leader>à >gv

imap <Leader>r :registers
imap <Leader>i #include
imap <Leader>d #define

"filtype dependent commands
"see more on http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
filetype on
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab  "for makefiles, go with tabs
autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab  "for c, go with tabs
autocmd FileType h setlocal ts=8 sts=8 sw=8 noexpandtab  "for h, go with tabs
autocmd FileType man setlocal nolist colorcolumn=0 "manpages, yay
"autocmd FileType python source ~/.vim/python/mystuff.vim

"" plugins
" pathogen
execute pathogen#infect()

"filetype off
"call pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on
"syntax on
