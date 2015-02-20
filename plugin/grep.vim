function! s:Grep(bang, command, args)
    let grepprg = &l:grepprg
    try
        let &l:grepprg = a:command
        silent execute 'grep! ' . a:args
        " Invert usual meaning of bang
        if !empty(a:bang) | cfirst | endif
        cwindow 20
    finally
        let &l:grepprg = grepprg
    endtry
endfunction

set grepformat=%f:%l:%m " ack-grep
set grepformat+=%f      " find

if executable("ack-grep")
    let s:grepprg = "ack-grep"
else
    let s:grepprg = "grep"
endif

command! -bang -nargs=+ -complete=file Grep
            \ call s:Grep(<q-bang>, s:grepprg, <q-args>)

command! -bang -nargs=+ -complete=file Find
            \ call s:Grep(<q-bang>, 'find', <q-args>)


" Grep word under cursor
noremap <leader>* :execute "Grep <c-r><c-w>"<cr>
