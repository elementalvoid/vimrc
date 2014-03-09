""""""""""""""""""""""""""""""
" => Begin
""""""""""""""""""""""""""""""
set nocompatible " be vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


""""""""""""""""""""""""""""""
" => airline
""""""""""""""""""""""""""""""
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


""""""""""""""""""""""""""""""
" => Git
""""""""""""""""""""""""""""""
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'mhinz/vim-signify'


""""""""""""""""""""""""""""""
" => Languages
""""""""""""""""""""""""""""""
"Bundle 'vim-scripts/bash-support.vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'indentpython'
Bundle 'Python-Syntax'
Bundle 'tmatilai/gitolite.vim'


""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""
Bundle 'altercation/vim-colors-solarized'
set t_Co=256 " enable 256 color mode (which supports transparency)
set background=dark
colorscheme solarized


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'scrooloose/syntastic'
"Bundle 'wincent/Command-T'
"Bundle 'Raimondi/delimitMate'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'christoomey/vim-space'
Bundle 'sickill/vim-pasta'
Bundle 'edsono/vim-matchit'
Bundle 'deb.vim'
Bundle 'The-NERD-Commenter'
Bundle 'gnupg.vim'
Bundle 'dan-bolsun/vim-tmux'

Bundle 'elementalvoid/Show-mandictperldocpydocphpdoc-use-K'
let g:man_it_focus_window = 1

Bundle 'sjl/gundo.vim'
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
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif


""""""""""""""""""""""""""""""
" => HexMan
""""""""""""""""""""""""""""""
Bundle 'hexman.vim'
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
Bundle 'SyntaxComplete'

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletion="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'


""""""""""""""""""""""""""""""
" => Snipmate
""""""""""""""""""""""""""""""
"Bundle 'superSnipMate'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'


""""""""""""""""""""""""""""""
" => trailing whitespace
""""""""""""""""""""""""""""""
Bundle 'bronson/vim-trailing-whitespace'
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap <leader>ff :FixWhitespace<cr>
inoremap <leader>ff <esc>:FixWhitespace<cr>a


""""""""""""""""""""""""""""""
" => Finale
""""""""""""""""""""""""""""""
filetype plugin indent on
