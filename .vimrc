"" Grafical - no impact "
"""""""""""""""""""""""""
set number              " line numbers
set ruler               " current posizion in corner
set showcmd             " show the command you are typing
set colorcolumn=81      " highlight 80th col
set nolist              " end of line and trailing spaces visibility
set listchars=trail:¤,tab:>-,eol:.
syntax on               " syntax highlight enabled

set splitbelow          " split in a logic way
set splitright          " split in a logic way

"" Grafical - affecting vim "
"""""""""""""""""""""""""""""
set modeline            " allow modeline ( /* vim: set sw=2: */ )
" if terminal allow funny coloring, use them all!
if $TERM == "xterm" || $TERM == "screen-256color"
    set t_Co=256
    colorscheme bubblegum
else
    colorscheme desert
endif

set ignorecase          " search is not case sensitive
set nohlsearch          " highlight searchs

" thanks to Ton Kersten https://github.com/tonk/dotfiles/blob/master/vim/vimrc
set laststatus=2        " statusline ALWAYS visible
"set statusline=
"set statusline+=%f\                             " filename (basename)
"set statusline+=%h%m%r%w                        " status flags
"set statusline+=\[%{strlen(&ft)+2?&ft:'none'}]  " file type


"" Tabs "
"""""""""
set tabstop=4           " 4 spaces for a tab
set shiftwidth=4
set softtabstop=4
set expandtab           " use spaces, not tabs
set autoindent          " automatic indentation

"" Other "
""""""""""
set mouse=""            " disable mouse
set exrc                " enable local .exrc file
set noswapfile          " no .%.swp
au BufWritePre * %s/\s\+$//e    "kill trailing spaces at save
" sessions, use :mksession to create new one
set sessionoptions=blank,buffers,curdir,help,options,resize,winsize
set wildmenu                " autocomplete suggestion menu
set wildmode=longest,list   " autocomplete term style

"" mapping "
""""""""""""
"allow link follow with enter
nmap £ <C-]>

cmap è  <Esc><Esc>
imap è  <Esc><Esc>
map  è  <Esc><Esc>
vmap è  <Esc><Esc>

let mapleader = "é"

cmap <Leader><Leader>  <Esc><Esc>
imap <Leader><Leader>  <Esc><Esc>
map  <Leader><Leader>  <Esc><Esc>
vmap <Leader><Leader>  <Esc><Esc>

map <Leader>O O<Esc>j
map <Leader>o o<Esc>k
map <Leader>h :set hlsearch!<Esc>
map <Leader>l :set list!<Esc>
map <Leader>w :w<Esc>
map <Leader>W :wall<Esc>
map <Leader>. :<Esc>
map <Leader>r :registers<Esc>
map <Leader>m :marks<Esc>
map <Leader>j :jumps<Esc>
map <Leader>t :tags<Esc>
" window resize: leader, [shift] + arrows
map <leader><Esc>OC :vertical resize +5<Esc>
map <leader><Esc>OD :vertical resize -5<Esc>
map <leader><Esc>[1;2C :vertical resize +1<Esc>
map <leader><Esc>[1;2D :vertical resize -1<Esc>
map <leader><Esc>OA :resize +5<Esc>
map <leader><Esc>OB :resize -5<Esc>
map <leader><Esc>[1;2A :resize +1<Esc>
map <leader><Esc>[1;2B :resize -1<Esc>

vmap <Leader>c :s,^,//,<Esc>
vmap <Leader>C :s,^//,,<Esc>
vmap <Leader>l <gv
vmap <Leader>à >gv

imap <Leader>r <C-o>:registers<Esc>
imap <Leader>i #include
imap <Leader>d #define

"" filtype dependent commands "
"""""""""""""""""""""""""""""""
"see more on http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
filetype on
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab  "for makefiles, go with tabs
autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c setlocal foldmethod=syntax tags+=~/linux/lib/tags  "for c, go with tabs
autocmd FileType c :% foldopen!
autocmd FileType h setlocal ts=8 sts=8 sw=8 noexpandtab  "for h, go with tabs
autocmd FileType man setlocal cursorline nolist colorcolumn=0 "manpages, yay
autocmd FileType man map q :q!<Esc>
autocmd FileType help setlocal cursorline nolist colorcolumn=0 "help, yay
"autocmd FileType python source ~/.vim/python/mystuff.vim

""_________"
"" plugins "
""""""""""""

" pathogen
execute pathogen#infect()

"filetype off
"call pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on
"syntax on
