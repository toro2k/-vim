" Here .vimrc is ignored by Vim.
" Link it in home or run vim -u /path/to/here.
" Don't forget .gvimrc!

set nocompatible

execute pathogen#infect()

syntax on
filetype plugin indent on


set autoread
set scrolloff=3
set laststatus=2

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set incsearch
set ignorecase
set smartcase
set hlsearch

set nobackup
set nowritebackup
set noswapfile

set wildmode=list:longest,full

set clipboard=unnamedplus,exclude:cons\|linux

set colorcolumn=80

colorscheme toro2k


noremap j gj
noremap k gk

noremap H ^
noremap L $

noremap Y y$

" Uppercase the word under cursor
inoremap <c-u> <esc>viwUea

" Clear current line
noremap <leader>cc cc<esc>

" Disable devilish mappings
noremap Q <nop>
noremap q: <nop>

noremap <silent> <leader>bd :bdelete<cr>
noremap <leader>hh :set hlsearch! hlsearch?<cr>

noremap <leader>ev :split + $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>


if &diff
    noremap dq :qall<cr>
    syntax off
endif


augroup misc
    autocmd!
    " Remove trailing spaces on save from ANY file
    autocmd BufWritePre * %s/\s\+$//e
    " Turn on sql ftplugin when edit files from MySQL client
    autocmd BufRead /tmp/sql* setfiletype sql
augroup END


if filereadable(expand("~/.vim/typos.vim"))
    source ~/.vim/typos.vim
endif
