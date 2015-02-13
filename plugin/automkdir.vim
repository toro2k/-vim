function! AutoMkdir(path)
    if isdirectory(a:path)
        write | return
    endif

    let prompt = "Directory " . a:path . " is missing. Create it?"
    echohl Question | echo prompt | echohl None

    let response = nr2char(getchar())
    if response ==? "y"
        call mkdir(a:path, "p") | write
    endif
endfunction

augroup automkdir
    autocmd!
    autocmd BufWriteCmd *
                \ doautocmd BufWritePre |
                \ call AutoMkdir(expand("<afile>:p:h")) |
                \ doautocmd BufWritePost
augroup END
