nnoremap <CR> o<CR><CR><Up>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Shortcutting split navigation, saving a keypress:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

" movement
nnoremap j gj
nnoremap k gk

" Replace all is aliased to S.
nnoremap S :%s/\V/g<Left><Left>
vnoremap S :s/\%V/g<Left><Left>

" <Ctrl-l> redraws the screen and removes any search highlighting.
"nnoremap <Esc> :nohl<CR><Esc>
