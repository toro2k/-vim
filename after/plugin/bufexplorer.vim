function! SaferBufExplorer()
    if (&modified == 0)
        call BufExplorer()
    else
        echohl Error
        echo "No write since last change"
        echohl None
    endif 
endfunction

let g:bufExplorerDefaultHelp = 0
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowRelativePath = 1

noremap <silent> <leader>bb :call SaferBufExplorer()<cr>
noremap <silent> <leader>bs :BufExplorerHorizontalSplit<cr>
