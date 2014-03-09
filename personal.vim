""""""""""""""""""""""""""""""
" => The Basics
""""""""""""""""""""""""""""""
"follow the leader
let mapleader=";"

set secure
set mouse=a
set modeline
set showmatch " when a bracket is inserted, briefly jump to the matching one
set nowrap " don't wrap long test
set number " line numbers
set title
set showcmd " show command characters
set history=1000 "let's have a litle more of it
set cursorline "highlight the current line
set laststatus=2
set noshowmode " don't show current mode

" Don't auto format comments when hitting <enter> in insert mode
" or <o>/<O> in normal mode
set fo=tcq

"avoid escape key
imap jj <esc>

"have command-line completion <Tab> (for filenames, help topics, option names)
"first list the available options and complete the longest common part, then
"have further <Tab>s cycle through the possibilities:
set wildmode=list:longest

syntax on

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

" mapping timeouts
" timeout on mapping after 500ms - should be slower than you usually type
" timeout on key codes after 100ms - should be faster than you can type
set timeout
set timeoutlen=500
set ttimeoutlen=100


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
" => Completion
""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif
"let g:omni_syntax_use_iskeyword = 0


""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
set hlsearch " highlight as you search
set incsearch " scroll as you search
set ignorecase " searches are case-insensitive
set smartcase " unless they contain upper-case letters


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
  if len(split(@b,"\n")) > 1
    execute ":bw"
  else
    execute ":q"
  endif
endfunction

"write and quit buffers
map <leader>w :w<cr>
map <leader>q :call SmartQuit()<cr>
map <leader>wq :w<cr><esc>:call SmartQuit()<cr>
"write a buffer when we forgot to sudoedit
map <leader>fw :w !sudo tee %<cr><cr>:e<cr>

"Setup a cmd to edit a file in the pwd
map <leader>e :e <c-r>=expand('%:p:h')<cr>/

"Buffer naviation
map <M-Left> :bprevious<cr>
map <M-Right> :bnext<cr>

"Buffer Explorer
nnoremap <F5> :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
"paste toggle
function! TogglePaste()
  if &mouse == 'a'
    set mouse=
    set paste
    set nonumber
    echo "Paste mode on"
  else
    set mouse=a
    set nopaste
    set number
    echo "Paste mode off"
  endif
endfunction
nnoremap <F8> :call TogglePaste()<cr>
inoremap <F8> <esc>:call TogglePaste()<cr>a

"wrap toggle
nnoremap <F9> :set wrap!<cr>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d sts=%d %s tw=%d :",
        \ &filetype, &tabstop, &shiftwidth, &softtabstop,
        \&expandtab == 1 ? 'et': '', &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" make navigating help tags easier.
"nnoremap <silent> <buffer> <cr> <c-]>
"nnoremap <silent> <buffer> <bs> <c-t>

""""""""""""""""""""""""""""""
" => Omni Completion
""""""""""""""""""""""""""""""
"let omnifunc=syntaxcomplete#Complete
"let g:omni_syntax_use_iskeyword = 0
set completeopt=menu,longest,preview


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


""""""""""""""""""""""""""""""
" => Bundles
""""""""""""""""""""""""""""""
" Use `make` to install bundles in a new repo
source ~/.vim/bundle.vim


" vim: set ft=vim ts=2 sw=2 tw=78 :
