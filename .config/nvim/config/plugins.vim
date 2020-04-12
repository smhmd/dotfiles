call plug#begin('~/.config/nvim/plugged/')


" C O M P L E T I O N
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "let g:coc_global_extensions = ['coc-vetur', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

Plug 'tmsvg/pear-tree'
  " Disable dot-repeatable
  let g:pear_tree_repeatable_expand = 0
  let g:pear_tree_smart_openers = 1

  " Enable Smart pairs
  let g:pear_tree_smart_closers = 1
  let g:pear_tree_smart_backspace = 1

"Plug 'mattn/emmet-vim'
  "let g:user_emmet_leader_key=','

" I N T E G R A T I O N
"Plug 'tpope/vim-fugitive'

"Plug 'junegunn/fzf.vim'

"Plug 'shime/vim-livedown'
  "let g:livedown_open = 0


" L A N G U A G E   S U P P O R T
"Plug 'lervag/vimtex'
  "let g:tex_flavor = 'latex'
  "let g:livepreview_previewer = 'zathura' " Set previewer to zathura for latex

Plug 'othree/html5.vim'

"Plug 'posva/vim-vue'
  "let g:vue_pre_processors = ['pug', 'postcss']
  ""let g:vim_vue_plugin_use_pug = 1

"Plug 'digitaltoad/vim-pug'

"Plug 'vim-pandoc/vim-pandoc'

"Plug 'vim-pandoc/vim-pandoc-syntax'

"Plug 'vim-pandoc/vim-rmarkdown'

"Plug 'godlygeek/tabular'

"Plug 'plasticboy/vim-markdown'



" T H E M I N G
Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'

"Plug 'lilydjwg/colorizer'

"Plug 'ryanoasis/vim-devicons'


" I N T E R F A C E
Plug 'thinca/vim-localrc'

"Plug 'preservim/nerdcommenter'

"Plug 'skywind3000/asyncrun.vim'

Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Plug 'PeterRincker/vim-argumentative'


" S Y N T A X   H I G H L I G H T I N G
Plug 'kovetskiy/sxhkd-vim'

Plug 'VebbNix/lf-vim'

"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-eunuch'
"Plug 'mg979/vim-visual-multi'
"Plug 'lukesmithxyz/vimling'
"Plug 'rhysd/vim-grammarous'
"Plug 'chrisbra/csv.vim'
call plug#end()
