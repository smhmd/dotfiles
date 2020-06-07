" Init settings "
""""""""""""""""""""
let mapleader=","

set noautoindent
"set autoindent
"set smartindent
set smartcase
set ignorecase
set autoread
set autowrite
set number relativenumber
set nolist nowrap linebreak breakat&vim
set encoding=utf-8
"set scrolloff=50
"set cursorline
"set expandtab
"set list
"set listchars=tab:\|\ ,trail:▫
set noswapfile
set number
set ruler
set title
set updatetime=100
set termguicolors
set mouse=a
set tabstop=5 softtabstop=0 expandtab shiftwidth=2
set cursorline
set noshowmode
set backupcopy=yes "disable safe write for hmr in parcel
set wildmode=longest,list,full "completion
set wildmenu
set complete=.,w,b,u,t,i,kspell
colorscheme gruvbox

"autocmd BufNewFile * startinsert
"autocmd VimEnter * if empty(expand("%")) | startinsert | endif
"autocmd VimEnter * if getfsize(expand("%")) == 0 | startinsert | endif

autocmd BufRead associations set syntax=scheme
autocmd BufRead .xinitrc set syntax=sh
autocmd BufNewFile,BufRead *.md,*.rmd set wrap
autocmd BufRead,BufNewFile *.vue setfiletype html
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automate commands on file write
autocmd BufWritePost /home/me/.config/sxhkd/sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost /home/me/.Xresources !xrdb %
autocmd BufWritePost /home/me/.config/dunst/dunstrc !killall dunst && setsid dunst > /dev/null 2>&1
autocmd BufWritePost /home/me/.local/bin/dwmbar !dwmbar > /dev/null 2>&1
autocmd BufWritePost /home/me/.local/src/dwm/config.h !sudo make --directory '/home/me/.local/src/dwm/' clean install
autocmd BufWritePost /home/me/.local/src/st/config.h !sudo make --directory '/home/me/.local/src/st/' clean install

" Change Background
"augroup insertmodecolor
"  autocmd!
"  autocmd InsertEnter * call (let g:gruvbox_contrast_dark = 'medium')
"  autocmd InsertLeave * call (let g:gruvbox_contrast_dark = 'medium')
"augroup END

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
