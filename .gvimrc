" :help 'guioptions'
set go-=m  " remove menu bar
set go-=T  " remove tool bar
set go-=r  " remove right scroll bar
set go-=L  " remove left scroll bar when NERDTree is open

" Set the variable in .profile
execute "set guifont=\"" . $GVIM_FONT . "\""
