" Plugin management "
"""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged/')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmsvg/pear-tree'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'mg979/vim-visual-multi'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lilydjwg/colorizer'
Plug 'preservim/nerdcommenter'
"Plug 'lukesmithxyz/vimling'
"Plug 'rhysd/vim-grammarous'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'chrisbra/csv.vim'
Plug 'rhysd/clever-f.vim'
call plug#end()


" Plguin options "
""""""""""""""""""

" tmsvg/pear-tree
let g:pear_tree_repeatable_expand = 0 " Disable dot-repeatable
let g:pear_tree_smart_openers = 1    """"""""""""""""""""""
let g:pear_tree_smart_closers = 1    " Enable Smart pairs "
let g:pear_tree_smart_backspace = 1  """"""""""""""""""""""

let g:livepreview_previewer = 'zathura' " Set previewer to zathura for latex

"let g:gruvbox_italic = 1 " Add italics to gruvbox


let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

" vim-vue
let g:vue_pre_processors = ['pug', 'postcss']

" clever-f
let g:clever_f_fix_key_direction = 1
