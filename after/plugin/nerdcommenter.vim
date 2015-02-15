let g:NERDSpaceDelims = 1


function! s:NERDCommenterMap(keys, function)
    for mode in ["n", "x"]
        let map = mode . "noremap"
        let command = ":call NERDComment(\"" . mode . "\", \"" . a:function . "\")"
        execute join([map, a:keys, command, "<cr>"], " ")
    endfor
endfunction

call s:NERDCommenterMap("<leader>cl", "alignleft")
call s:NERDCommenterMap("<leader>cu", "uncomment")
call s:NERDCommenterMap("<leader>cy", "yank")
