" :help 'guioptions'
set go-=m  " remove menu bar
set go-=T  " remove tool bar
set go-=r  " remove right scroll bar
set go-=L  " remove left scroll bar when NERDTree is open


" Set the variable in .profile
if len($GVIM_FONT) ># 0
    execute "set guifont=" . $GVIM_FONT
else
    echomsg "$GVIM_FONT is not set!"
endif
