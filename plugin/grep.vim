if executable("ack-grep")
    set grepprg=ack-grep\ --no-color
endif

" function! Grep(arguments)
"     silent execute ":grep " . a:arguments
"     copen
" endfunction

command! -nargs=+ -complete=file Grep silent execute "grep <args>" | copen
