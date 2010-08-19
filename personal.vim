set nocompatible
set mouse=a


""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""
"set t_Co=256 " enable 256 color mode (which supports transparency)
set background=dark
colorscheme peaksea


""""""""""""""""""""""""""""""
" =>Tabbing and indenting
""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2 " if it looks like a tab, we can delete it like a tab
set shiftround " < and > will hit indentation levels
set expandtab

"Some handy tab width goodness
map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=8<cr>


""""""""""""""""""""""""""""""
" => Super Tab plugin
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletion="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"


""""""""""""""""""""""""""""""
" => Coding
""""""""""""""""""""""""""""""
set showmatch " when a bracket is inserted, briefly jump to the matching one
syntax on


""""""""""""""""""""""""""""""
" => TagList
""""""""""""""""""""""""""""""
"tags - directory of current file, then search up from working dir
set tags=./tags,tags;
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.


""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
set hlsearch " highlight as you search
set incsearch " scroll as you search
set ignorecase " searches are case-insensitive
set smartcase " unless they contain upper-case letters


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2
function! GitBranchStatus()
  let git_branch = GitBranch()
  if strlen(git_branch)
    return '[Git (' . git_branch . ')]'
  endif
  return ''
endfunction
au BufNewFile,BufRead * set statusline=%f%m%r%h%w\ [BUFFER\ #%n]\ [TYPE=%Y]\ %(\%{GitBranchStatus()}\ %)[ASCII=%03.3b\ HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako


""""""""""""""""""""""""""""""
" => Buffers
""""""""""""""""""""""""""""""
"allow hidden buffers (modified buffers in background)
set hidden

"Quickly open a buffer for scribble
map <leader>n :e ~/notes<cr>

"Quickly open a buffer for the VimRC
map <leader>v :e ~/.vim/personal.vim<cr>
"and reload it when edited
autocmd! bufwritepost personal.vim source ~/.vim/personal.vim

":q screws me up, so need a macro to kill buffer
function! SmartQuit ()
  redir @b | silent ls | redir END
  let bufCount = split(@b,"\n")
  if len(split(@b,"\n")) > 1
    execute ":bw"
  else
    execute ":q"
  endif
endfunction
map <leader>q :call SmartQuit()<cr>

"Setup a cmd to edit a file in the pwd
map <leader>e :e <c-r>=expand('%:p:h')<cr>/

"write and quit buffers
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>wq :wq<cr>
map <leader>wa :wa<cr>
map <leader>wqa :wqa<cr>
map <leader>qa :qa

"Buffer naviation
map <M-Left> :bprevious<cr>
map <M-Right> :bnext<cr>


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
set nowrap " don't wrap long test
set number " line numbers
set title
set showmode " show current mode
set showcmd " show command characters

"have command-line completion <Tab> (for filenames, help topics, option names)
"first list the available options and complete the longest common part, then
"have further <Tab>s cycle through the possibilities:
set wildmode=list:longest

"paste toggle
nnoremap <F8> :set invpaste paste?<cr>
set pastetoggle=<F8>

"allow Ctrl-A and Ctrl-X to work on all variants
set nrformats=octal,hex,alpha

"always change the working dir to that of the file in the buffer
set autochdir

"give three lines of context when moving the cursor around
set scrolloff=3

"if you :q with changes it asks you if you want to continue or not
set confirm

" have Y behave analogously to D rather than to dd
nmap Y y$

"Toggle mouse=a mode
map <leader>m :setlocal mouse&<cr>
map <leader>mm :setlocal mouse=a<cr>


""""""""""""""""""""""""""""""
" => Cope (:h cope)
""""""""""""""""""""""""""""""
map <leader>cc :botright cope<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>


""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when in a git/svn commit message.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && expand('%Y') != "COMMIT_EDITMSG" |
    \   exe "normal g`\"" |
    \ endif
endif

""""""""""""""""""""""""""""""
" => Grep & Search
""""""""""""""""""""""""""""""
"let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git'
"set grepprg=/bin/grep\ -nH
" Try do use the ack program when available
let tmp = ''
for i in ['ack', 'ack-grep']
  let tmp = substitute (system ('which '.i), '\n.*', '', '')
  if v:shell_error == 0
    exec "set grepprg=".tmp."\\ -a\\ -H\\ --nocolor\\ --nogroup"
    break
  endif
endfor
unlet tmp

"grep for word under cursor in the current file
"nnoremap <leader>gw <esc>:grep <cword> % <cr><cr><cr>
"search for word under cursor and go to next match
nnoremap <leader>gw <esc>:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>n

