" Vim Global plugin for ls and stuff
" Last change:  -
" ...


" Script init stuff
if exists("loaded_ll")
    finish
endif
let loaded_ll = 1

"for line continuation - i.e dont want C in &cpo
let s:old_cpo = &cpo
set cpo&vim

" plugin goes here

noremap <script> <Plug>llLongList  <SID>LongList
noremap <SID>LongList   :call <SID>LongList()<cr>

" fun time
function s:LongList()
    args
    ls
endfunction

"reset &cpo back to users setting
let &cpo = s:old_cpo
