""""""""""""""""""""""""""""""
" => Begin
""""""""""""""""""""""""""""""
set nocompatible " be vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'mhinz/vim-signify' " vcs changes in gutter
"Plugin 'vim-scripts/bash-support.vim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'spf13/vim-autoclose' " auto close quotes/parens/etc.
Plugin 'surround.vim' " change, delete, add surroungings
Plugin 'repeat.vim' " enable repeating supported plugin maps with '.'
Plugin 'terryma/vim-multiple-cursors' " like sublimetext multiselect
Plugin 'klen/python-mode'
Plugin 'yssource/python.vim' " python support (up to date version of packaged script)
Plugin 'python_match.vim'
Plugin 'pythoncomplete'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'scrooloose/syntastic' " syntax checking using external tools
Plugin 'kien/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'sickill/vim-pasta'
Plugin 'edsono/vim-matchit'
Plugin 'deb.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gnupg.vim'
Plugin 'dan-bolsun/vim-tmux'
if executable('ctags')
  Plugin 'majutsushi/tagbar'
endif
Plugin 'hexman.vim'
Plugin 'SyntaxComplete'
Plugin 'neocomplcache'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Arduino-syntax-file'
Plugin 'stephpy/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  Bundle 'mileszs/ack.vim'
elseif executable('ack')
  Bundle 'mileszs/ack.vim'
endif

Plugin 'mbbill/undotree'
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

call vundle#end()
filetype plugin indent on
