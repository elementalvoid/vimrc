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
Plugin 'mhinz/vim-signify'
"Plugin 'vim-scripts/bash-support.vim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'indentpython'
Plugin 'Python-Syntax'
Plugin 'tmatilai/gitolite.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'scrooloose/syntastic'
"Plugin 'wincent/Command-T'
"Plugin 'Raimondi/delimitMate'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'christoomey/vim-space'
Plugin 'sickill/vim-pasta'
Plugin 'edsono/vim-matchit'
Plugin 'deb.vim'
Plugin 'The-NERD-Commenter'
Plugin 'gnupg.vim'
Plugin 'dan-bolsun/vim-tmux'
Plugin 'elementalvoid/Show-mandictperldocpydocphpdoc-use-K'
Plugin 'sjl/gundo.vim'
if executable('ctags')
  Plugin 'majutsushi/tagbar'
endif
Plugin 'hexman.vim'
Plugin 'SyntaxComplete'
Plugin 'ervandew/supertab'
"Plugin 'superSnipMate'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/snipmate-snippets'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""
" => airline
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""
set t_Co=256 " enable 256 color mode (which supports transparency)
set background=dark
silent! colorscheme solarized


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
let g:man_it_focus_window = 1

nnoremap <F3> :GundoToggle<CR>


""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""
"tags - directory of current file, then search up from working dir
set tags=./tags,tags;
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_compact=1
let g:tagbar_autoclose=1


""""""""""""""""""""""""""""""
" => HexMan
""""""""""""""""""""""""""""""
map <leader>hm <Plug>HexManager<cr>
map <leader>hmd <Plug>HexDelete<cr>
map <leader>hmi <Plug>HexInsert<cr>
map <leader>hmg <Plug>HexGoto<cr>
map <leader>hmn <Plug>HexNext<cr>
map <leader>hmp <Plug>HexPrev<cr>
map <leader>hmt <Plug>HexToggle<cr>
map <leader>hms <Plug>HexStatus<cr>
map <leader>hmf <Plug>HexFind<cr>


""""""""""""""""""""""""""""""
" => Completion
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletion="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'


""""""""""""""""""""""""""""""
" => trailing whitespace
""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap <leader>ff :FixWhitespace<cr>
inoremap <leader>ff <esc>:FixWhitespace<cr>a
