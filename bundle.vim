""""""""""""""""""""""""""""""
" => Begin
""""""""""""""""""""""""""""""
set nocompatible " be vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'habamax/vim-polar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mhinz/vim-signify' " vcs changes in gutter
Plugin 'spf13/vim-autoclose' " auto close quotes/parens/etc.
Plugin 'surround.vim' " change, delete, add surroungings
Plugin 'repeat.vim' " enable repeating supported plugin maps with '.'
Plugin 'terryma/vim-multiple-cursors' " like sublimetext multiselect
Plugin 'klen/python-mode'
Plugin 'yssource/python.vim' " python support (up to date version of packaged script)
Plugin 'python_match.vim'
Plugin 'pythoncomplete'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'scrooloose/syntastic' " syntax checking using external tools
Plugin 'kien/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'sickill/vim-pasta'
Plugin 'jwhitley/vim-matchit'
Plugin 'deb.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gnupg.vim'
Plugin 'tmux-plugins/vim-tmux'
if executable('ctags')
  Plugin 'majutsushi/tagbar'
endif
Plugin 'SyntaxComplete'
"Plugin 'neocomplcache'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'fatih/vim-go'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'elementalvoid/ansible-vim'
Plugin 'hashivim/vim-terraform'

Plugin 'mbbill/undotree'
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

call vundle#end()
filetype plugin indent on
