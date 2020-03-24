if !exists('g:vscode')
  source $HOME/.config/nvim/config/plugins.vim
endif
source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/init.vim

if exists('g:vscode')
  call plug#begin('~/.config/nvim/plugged/')
    Plug 'rhysd/clever-f.vim'
      let g:clever_f_fix_key_direction = 1
  call plug#end()
endif
