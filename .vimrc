" Plugin management

call plug#begin('~/.config/nvim/plugged/')
Plug 'mg979/vim-visual-multi'
call plug#end()


" General settings
set autoindent
set smartindent
set autoread
set autowrite
set number relativenumber
set nolist wrap linebreak breakat&vim
"set colorcolumn=81
"set cursorline
set encoding=utf-8
set expandtab
"set list
"set listchars=tab:\|\ ,trail:▫
set noswapfile
set number
set ruler
set softtabstop=2
set tabstop=2
set title
set updatetime=100

if has('mouse')
    set mouse=a
endif

autocmd BufWritePre * :%s/\s\+$//e

