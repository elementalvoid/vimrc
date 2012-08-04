set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'vim-scripts/bash-support.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'motemen/git-vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'tmatilai/gitolite.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
"Bundle 'wincent/Command-T'
"Bundle 'Raimondi/delimitMate'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'christoomey/vim-space'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'edsono/vim-matchit'

" snipmate and its dependencies
"Bundle 'superSnipMate'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'

Bundle 'puppetlabs/puppet-syntax-vim'

Bundle 'bronson/vim-trailing-whitespace'

Bundle 'dan-bolsun/vim-tmux'

filetype plugin indent on
