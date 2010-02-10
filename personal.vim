set nocompatible

""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""
set t_Co=256 " enable 256 color mode (which supports transparency)
colorscheme peaksea

""""""""""""""""""""""""""""""
" =>Tabbing and indenting
""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


""""""""""""""""""""""""""""""
" => Coding
""""""""""""""""""""""""""""""
set showmatch " when a bracket is inserted, briefly jump to the matching one
syntax on


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
set statusline=%f%m%r%h%w\ [BUFFER\ #%n]\ [TYPE=%Y]%(\ %{GitBranchStatus()}\ %)[ASCII=%03.3b\ HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
set nowrap " don't wrap long test
set number " line numbers
set title
set showmode " show current mode
set showcmd " show command characters

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest

"Quickly open a buffer for scribble
map <leader>n :e ~/notes<cr>

"Quickly open the VimRC
map <leader>v :e ~/.vim/personal.vim<cr>

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

"paste toggle
nnoremap <F8> :set invpaste paste?<cr>
set pastetoggle=<F8>

"allow hidden buffers (modified buffers in background)
set hidden

"allow Ctrl-A and Ctrl-X to work on all variants
set nrformats=octal,hex,alpha

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
"search for word under cursor
nnoremap <leader>gw <esc>:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>


""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on

