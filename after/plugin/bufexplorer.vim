function! SaferBufExplorer()
    if (&modified == 0)
        call BufExplorer()
    else
        echohl Error
        echo "No write since last change"
        echohl None
    endif 
endfunction

let g:bufExplorerShowRelativePath = 1

" Default mappings are ignored in .vim/plugin/bufexplorer.vim
noremap <silent> <leader>bb :call SaferBufExplorer()<cr>
noremap <silent> <leader>bs :BufExplorerHorizontalSplit<cr>
