" Vim Global plugin for python documentation access
" Last change: Wed Nov 19 10:26:23 CET 2014
" ...

" TODO: finish if file not python?

" Script init stuff
if exists("loaded_pyref")
    "finish
endif
let loaded_pyref= 1

"for line continuation - i.e dont want C in &cpo
let s:old_cpo = &cpo
set cpo&vim

" plugin goes here

" OPERATOR
"nnoremap    <leader>x :set operatorfunc=<SID>GrepRec<cr>g@
"vnoremap    <leader>x :<c-u>call <SID>GrepRec(visualmode())<cr>

" no motion allowed
if !hasmapto('<Plug>PyrefBuiltin')
    " TODO map in vimrc if python file
    map <unique> <Leader>x  <Plug>PyrefBuiltin
endif

noremap <script> <Plug>PyrefBuiltin <SID>Builtin
noremap <SID>Builtin   :call <SID>Builtin()<cr>

command! -nargs=1 Pp call <SID>Lib(<args>)

let g:pyref_path_lib_f = '~/python/python-3.4.2-docs-text/library/functions.txt'
let g:pyref_path_full  = '~/python/python-3.4.2-docs-text/'

"grep -HnR '^str\.[a-z_]\+(.*)$' .

" search 'builtin' function under the cursor
function! s:Builtin()
    let curwin = winnr()
    silent execute "grep! '^" . expand("<cword>") . "(.*)$' " . g:pyref_path_lib_f
    redraw!
    let qf_list = getqflist()
    if(len(qf_list) == 0)
        echom 'NO MATCH FOUND'
        return
    endif
    if(len(qf_list) == 1)
        echom 'ONE MATCH FOUND'
        execute "silent pedit +" .qf_list[0]['lnum'] . "|normal\\ zt " . bufname(qf_list[0]['bufnr'])
        return
    endif
    echom 'TOO MANY MATCHS FOUND!'

    "copen
endfunction

function! s:Lib(s)
    silent execute "grep! -R '^".a:s."\\.' " . g:pyref_path_full
    "silent execute "grep! -R 'str' " . g:pyref_path_full
    redraw!
    copen
endfunction

"reset &cpo back to users setting
let &cpo = s:old_cpo
