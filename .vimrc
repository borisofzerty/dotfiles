"" Graphical - no impact "  
"""""""""""""""""""""""""
set number              " line numbers
set ruler               " current posizion in corner
set showcmd             " show the command you are typing
set colorcolumn=81      " highlight 80th col
set nolist              " end of line and trailing spaces visibility
set listchars=trail:¤,tab:>-,eol:<
set scrolloff=3         " keep cursor distant from top/pottom while scrolling
syntax on               " syntax highlight enabled

set splitbelow          " split in a logic way
set splitright          " split in a logic way
set laststatus=2        " statusline ALWAYS visible
set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]%h%r%=[0x%B]\ %c,%l/%L\ %p%%


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


"" Tabs "
"""""""""
set tabstop=4           " 4 spaces for a tab
set shiftwidth=4
set softtabstop=4
set expandtab           " use spaces, not tabs
set autoindent          " automatic indentation

"" Other "
""""""""""
set mouse=""                " disable mouse
set exrc                    " enable local .exrc file
set noswapfile              " no .%.swp
" sessions, use :mksession to create new one
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages
set wildmenu                " autocomplete suggestion menu
set wildmode=longest,list   " autocomplete term style
set nrformats+=alpha        " CTRL+A and CTRL+X works also for letters
set virtualedit=block       " enable virtualedit for visual block mode
set iskeyword-=_            " treat _ like whitespace and tabs

"" mapping "
""""""""""""
"allow link follow with enter
nnoremap £ <C-]>

"tabs navigation control-free-firefox-like
noremap <S-tab> :tabprevious<CR>
noremap <tab>   :tabnext<CR>
noremap 1<tab>  1gt<CR>
noremap 2<tab>  2gt<CR>
noremap 3<tab>  3gt<CR>
noremap 4<tab>  4gt<CR>
noremap 5<tab>  5gt<CR>
noremap 6<tab>  6gt<CR>
noremap 7<tab>  7gt<CR>
noremap 8<tab>  8gt<CR>
noremap 9<tab>  9gt<CR>
noremap <C-t>   :tabnew<CR>

" make Y behave like other capitals
noremap Y y$

" indent lines
nnoremap <left> <<
vnoremap <left> <gv
nnoremap <right> >>
vnoremap <right> >gv

" move lines up and down
nnoremap <up> kddpk
nnoremap <down> ddp
" TODO google a better way
vnoremap <up> :<C-u>sil! '<,'>m'<-2<CR>'<V'>
vnoremap <down> dp'[V']

" no arrow movement
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" exit form insert mode with move
inoremap jj <Esc>j
inoremap kk <Esc>k
inoremap JJ <Esc>o
inoremap KK <Esc>O
inoremap jk <Esc>

let mapleader = "é"
let maplocalleader = "à"

cnoremap <Leader><Leader>  <Esc><Esc>
inoremap <Leader><Leader>  <Esc><Esc>
noremap  <Leader><Leader>  <Esc><Esc>
vnoremap <Leader><Leader>  <Esc><Esc>

noremap <Leader>O O<Esc>j
noremap <Leader>o o<Esc>k
noremap <Leader>h :set hlsearch!<Esc>
noremap <Leader>l :set list!<Esc>
noremap <Leader>p :set paste!<Esc>
noremap <Leader>w :w<Esc>
noremap <Leader>r :registers<Esc>
noremap <Leader>m :marks<Esc>
noremap <Leader>j :jumps<Esc>
noremap <Leader>t :tags<Esc>
noremap <Leader>W :%s/\s\+$//e<CR>:w<CR>
" window resize: leader, [shift] + arrows
" TODO real key plz
"noremap <leader><up> :vertical resize +5<Esc>
"noremap <leader><Esc>OD :vertical resize -5<Esc>
"noremap <leader><Esc>[1;2C :vertical resize +1<Esc>
"noremap <leader><Esc>[1;2D :vertical resize -1<Esc>
"noremap <leader><Esc>OA :resize +5<Esc>
"noremap <leader><Esc>OB :resize -5<Esc>
"noremap <leader><Esc>[1;2A :resize +1<Esc>
"noremap <leader><Esc>[1;2B :resize -1<Esc>

vnoremap <Leader>c :s,^,#,<Esc>
vnoremap <Leader>C :s,^#,,<Esc>

inoremap <Leader>r <C-o>:registers<Esc>
inoremap <Leader>i #include
inoremap <Leader>d #define
inoremap <Leader>w <esc>:w<Esc>

" TODO enable those only if plugin is installed
noremap <Leader>, :TabooRename 
noremap <Leader>n :NERDTreeToggle<Esc>

"" filtype dependent commands "
"""""""""""""""""""""""""""""""
"see more on http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
" TODO group others too!
filetype on

augroup filetype_ruby
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby vnoremap <buffer> <LocalLeader>c :s,^,#,<Esc>
    autocmd FileType ruby vnoremap <buffer> <LocalLeader>C :s,^#,,<Esc>
augroup END

augroup filetype_eruby
    autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup filetype_vim
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType vim vnoremap <buffer> <LocalLeader>c :s,^,",<Esc>
    autocmd FileType vim vnoremap <buffer> <LocalLeader>C :s,^",,<Esc>
augroup END
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab  "for makefiles, go with tabs
autocmd FileType help setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c    setlocal ts=8 sts=8 sw=8 noexpandtab
"autocmd FileType c    setlocal foldmethod=syntax tags+=~/linux/lib/tags  "for c, go with tabs
"autocmd FileType c    :% foldopen!
autocmd FileType h    setlocal ts=8 sts=8 sw=8 noexpandtab  "for h, go with tabs
autocmd FileType cpp  setlocal ts=8 sts=8 sw=8 noexpandtab  "for h, go with tabs
autocmd FileType man  setlocal cursorline nolist colorcolumn=0 "manpages, yay
autocmd FileType man  noremap q :q!<Esc>
autocmd FileType help setlocal cursorline nolist colorcolumn=0 "help, yay
autocmd FileType text setlocal cursorline nolist colorcolumn=0
"autocmd FileType text noremap <Down> :/^[*=-]\+$/-1 :normal zt jj0<Esc>
"autocmd FileType text noremap <Up> :?^[*=-]\+$?-1 :normal zt 0<Esc>
"autocmd FileType python source ~/.vim/python/mystuff.vim

"" plugins "
""""""""""""

" tslime.vim communication between vim and tmux
"source ~/.vim/tslime.vim
"nnoremap <C-c> :Tmux ls<CR>


" pathogen
execute pathogen#infect()

"filetype off
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on
syntax on
