function! s:GetFileNameFromLine(line)
    let chunks = split(a:line, "|")
    return chunks[0]
endfunction

function! QuickfixFoldText()
    let first_line = getline(v:foldstart)
    let file_name = s:GetFileNameFromLine(first_line)
    let lines_count = v:foldend - v:foldstart + 1
    return file_name . "|" . lines_count . "|"
endfunction

function! QuickfixFoldExpr()
    let this_file_name = s:GetFileNameFromLine( getline(v:lnum) )
    let next_file_name = s:GetFileNameFromLine( getline(v:lnum + 1) )
    if this_file_name ==# next_file_name
        return '1'
    else
        return '<1'
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=QuickfixFoldExpr()
setlocal foldtext=QuickfixFoldText()

setlocal nowrap

noremap <buffer> o zo
noremap <buffer> c zc
