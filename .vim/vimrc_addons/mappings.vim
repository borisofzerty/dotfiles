let mapleader = "é"
let maplocalleader = "à"

"" using space to move between buffers "
""""""""""""""""""""""""""""""""""""""""

nnoremap <space><space>B :bfirst<CR>
nnoremap <space><space>b :blast<CR>
nnoremap <space>b :bnext<CR>
nnoremap <space>B :bNext<CR>
nnoremap <space><space>A :first<CR>
nnoremap <space><space>a :last<CR>
nnoremap <space>a :next<CR>
nnoremap <space>A :Next<CR>
nnoremap <space><space>T :tabfirst<CR>
nnoremap <space><space>t :tablast<CR>
nnoremap <space>t :tabnext<CR>
nnoremap <space>T :tabNext<CR>
nnoremap <space>1 :1tabnext<CR>
nnoremap <space>2 :2tabnext<CR>
nnoremap <space>3 :3tabnext<CR>
nnoremap <space>4 :4tabnext<CR>
nnoremap <space>5 :5tabnext<CR>
nnoremap <space>6 :6tabnext<CR>

"" Navigation "
"""""""""""""""

"allow link follow with enter
nnoremap £ <C-]>

"tabs navigation control-free-firefox-like
noremap <S-tab> :set relativenumber!<CR>

"" Moving text around "
"""""""""""""""""""""""

" indent lines
nnoremap <left> <<
vnoremap <left> <gv
nnoremap <right> >>
vnoremap <right> >gv

" move lines up and down
nnoremap <up> kddpk
nnoremap <down> ddp
" TODO: google a better way
vnoremap <up> :<C-u>sil! '<,'>m'<-2<CR>'<V'>
vnoremap <down> dp'[V']

noremap <Leader>O O<Esc>j
noremap <Leader>o o<Esc>k

"" Insert mode cool stuff "
"""""""""""""""""""""""""""

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

" readline(3) movement in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

" a couple bindings for better CamelCase and under_score_case navigation
source ~/.vim/vimrc_addons/camelCase.vim

"" Buffers related "
""""""""""""""""""""

" jump to buffers CTRL_^ replacement
noremap <leader>b <C-^>
noremap § <C-^>

noremap <Leader>w :w<Esc>
inoremap <Leader>w <esc>:w<Esc>
noremap <Leader>q :confirm q<Esc>
noremap <Leader>a :confirm qa<Esc>
noremap <Leader>W :%s/\s\+$//e<CR>:w<CR>

"" Shortcuts "
""""""""""""""

cnoremap <Leader><Leader>  <Esc><Esc>
inoremap <Leader><Leader>  <Esc><Esc>
noremap  <Leader><Leader>  <Esc><Esc>
vnoremap <Leader><Leader>  <Esc><Esc>

noremap <Leader>h :set hlsearch!<Esc>
noremap <Leader>l :set list!<Esc>
noremap <Leader>p :set paste!<Esc>
noremap <Leader>s :set spell!<Esc>

noremap <Leader>r :registers<Esc>
inoremap <Leader>r <C-o>:registers<Esc>
noremap <Leader>m :marks<Esc>
noremap <Leader>j :jumps<Esc>
noremap <Leader>t :tags<Esc>

nnoremap <Leader>v :execute "silent pedit +" . line(".") . "\|normal\\ zt %"<cr>
nnoremap <Leader>c :pclose<cr>

" make Y behave like other capitals
noremap Y y$

"" plugin related "
"""""""""""""""""""

noremap <Leader>n :NERDTreeToggle<Esc>

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-H> <Plug>snipMateBack
smap <C-H> <Plug>snipMateBack
imap <C-G> <Plug>snipMateShow
smap <C-G> <Plug>snipMateShow

map <Leader><space> <Plug>llLongList
