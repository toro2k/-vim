" Here .vimrc is ignored by Vim.
" Link it in home or run vim -u /path/to/here.
" Don't forget .gvimrc!

set nocompatible

execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme toro2k


set autoread
set scrolloff=3
set laststatus=2

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set incsearch
set hlsearch
set smartcase

set showcmd

set nobackup
set nowritebackup
set noswapfile

set wildmode=list:longest,full

set clipboard=unnamedplus,exclude:cons\|linux

set colorcolumn=80


command! EditVimrc split + $MYVIMRC
command! SourceVimrc source $MYVIMRC
command! ClearSearchPatternRegister let @/ = ""


noremap j gj
noremap k gk

noremap H ^
noremap L $

noremap Y y$

" Clear line
noremap <leader>cc cc<esc>

" Uppercase the word under cursor
inoremap <c-u> <esc>viwUea

noremap <silent> <c-p> :cprev<cr>
noremap <silent> <c-n> :cnext<cr>

" Disable devilish mappings
noremap Q <nop>
noremap q: <nop>

noremap <silent> <leader>bd :bdelete<cr>
noremap <silent> <leader>hh :ClearSearchPatternRegister<cr>

" Puts dirctory of current working file on command line
cnoremap <leader>fd <c-r>=expand("%:h")<cr>/


augroup misc
    autocmd!
    " Remove trailing spaces on save from ANY file
    autocmd BufWritePre * %s/\s\+$//e
    " Turn on sql ftplugin when edit files from MySQL client
    autocmd BufRead /tmp/sql* setfiletype sql
augroup END
