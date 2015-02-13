function! WriteWithPreAndPost()
    doautocmd BufWritePre
    write
    doautocmd BufWritePost
endfunction

function! AutoMkdir(path)
    if isdirectory(a:path)
        call WriteWithPreAndPost() | return
    endif

    let prompt = "Directory " . a:path . " is missing. Create it?"
    echohl Question | echo prompt | echohl None

    let response = nr2char(getchar())
    if response ==? "y"
        call mkdir(a:path, "p") | call WriteWithPreAndPost()
    endif
endfunction

augroup automkdir
    autocmd!
    autocmd BufWriteCmd * call AutoMkdir(expand("<afile>:p:h"))
augroup END
