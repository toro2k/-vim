let g:NERDSpaceDelims=1

nnoremap <leader>cl :call NERDComment("n", "alignleft")<cr>
xnoremap <leader>cl :call NERDComment("x", "alignleft")<cr>

nnoremap <leader>cu :call NERDComment("n", "uncomment")<cr>
xnoremap <leader>cu :call NERDComment("x", "uncomment")<cr>

nnoremap <leader>cy :call NERDComment("n", "yank")<cr>
xnoremap <leader>cy :call NERDComment("x", "yank")<cr>
