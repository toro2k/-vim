function! WriteAutoMkdir(file_path)
    silent doautocmd BufWritePre

    let file_path_chunks = split(a:file_path, "/", 1)
    let dir_name = join(file_path_chunks[0:-2], "/")

    if isdirectory(dir_name)
        execute "write " . a:file_path
        silent doautocmd BufWritePost
        return
    endif

    let prompt = "Directory " . dir_name . " is missing. Create it?"
    echohl Question | echo prompt | echohl None

    let response = nr2char(getchar())
    if response ==? "y"
        call mkdir(dir_name, "p")
        execute "write " . a:file_path
        silent doautocmd BufWritePost
    endif
endfunction

augroup automkdir
    autocmd!
    autocmd BufWriteCmd * call WriteAutoMkdir(expand("<amatch>:p"))
augroup END
