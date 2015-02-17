if executable("ack-grep")
    set grepprg=ack-grep\ --no-color
endif

command! -nargs=+ -complete=file Grep silent execute "grep <args>" | cwindow 20

" Grep word under cursor
noremap <leader>* :execute "Grep <c-r><c-w>"<cr>
