call plug#begin('~/.config/nvim/plugged/')


" C O M P L E T I O N
Plug 'tmsvg/pear-tree'
  " Disable dot-repeatable
  let g:pear_tree_repeatable_expand = 0
  let g:pear_tree_smart_openers = 1

  " Enable Smart pairs
  let g:pear_tree_smart_closers = 1
  let g:pear_tree_smart_backspace = 1


" T H E M I N G
Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'

Plug 'lilydjwg/colorizer'


" I N T E R F A C E
"Plug 'rhysd/clever-f.vim'
  "let g:clever_f_fix_key_direction = 1

Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#fabd2f' guibg='#282828' ctermfg=155
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#cc641d' guibg='#282828' ctermfg=81
  augroup END


" S Y N T A X   H I G H L I G H T I N G
Plug 'kovetskiy/sxhkd-vim'

Plug 'VebbNix/lf-vim'

call plug#end()
