set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bash-support.vim'
Bundle 'bufexplorer.zip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'motemen/git-vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'gitolite.vim'
Bundle 'SuperTab'
Bundle 'Syntastic'
"Bundle 'wincent/Command-T'
"Bundle 'Raimondi/delimitMate'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'christoomey/vim-space'
Bundle 'sickill/vim-pasta'
"Bundle 'vim-debug'
Bundle 'Gundo'
"Bundle 'superSnipMate'
if executable('ctags')
  Bundle 'taglist.vim'
endif
Bundle 'edsono/vim-matchit'

" snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'

filetype plugin indent on
