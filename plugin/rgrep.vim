function! s:RGrep(cmd, args)
    redraw
    echo "Searching ..."

    " If no pattern is provided, search for the word under the cursor
    if empty(a:args)
        let l:grepargs = expand("<cword>") . ' *'
    else
        let l:grepargs = a:args
    end

    silent execute a:cmd . " " . l:grepargs

    if a:cmd =~# '^l'
        botright lopen
    else
        botright copen
    endif

    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
    exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
    exec "nnoremap <silent> <buffer> o <CR>"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
    exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"

    redraw!
endfunction

function! s:RGrepFromSearch(cmd, args)
    let search =  getreg('/')
    " translate vim regular expression to perl regular expression.
    let search = substitute(search,'\(\\<\|\\>\)','\\b','g')
    call s:RGrep(a:cmd, '"' .  search .'" '. a:args)
endfunction

command! -bang -nargs=* -complete=file RGrep call s:RGrep('grep<bang>',<q-args>)
command! -bang -nargs=* -complete=file RGrepAdd call s:RGrep('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file RGrepFromSearch call s:RGrepFromSearch('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LRGrep call s:RGrep('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LRGrepAdd call s:RGrep('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file RGrepFile call s:RGrep('grep<bang> -g', <q-args>)
