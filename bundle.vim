set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline'

" Languages
"Bundle 'vim-scripts/bash-support.vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'indentpython'

Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'motemen/git-vim'
"Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'tmatilai/gitolite.vim'
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
Bundle 'deb.vim'
Bundle 'The-NERD-Commenter'
Bundle 'hexman.vim'
Bundle 'gnupg.vim'

" Completion
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'

" snipmate and its dependencies
"Bundle 'superSnipMate'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'

Bundle 'bronson/vim-trailing-whitespace'

Bundle 'dan-bolsun/vim-tmux'

filetype plugin indent on
