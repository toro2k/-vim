function! AutoMkdir(path)
    if isdirectory(a:path)
        write
        return
    endif

    echohl Question
    echo "Directory " . a:path . " is missing. Create it?"
    echohl None

    let response = nr2char(getchar())
    if response ==? "y"
        call mkdir(a:path, "p")
        write
    endif
endfunction

augroup automkdir
    autocmd!
    autocmd BufWriteCmd * call AutoMkdir(expand("<afile>:p:h"))
augroup END
