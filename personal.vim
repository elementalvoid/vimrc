" {{{ Bundles
source ~/.vim/bundle.vim
" }}}

" {{{ Personalization
let mapleader=";" "follow the leader

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
set showtabline=2
set noshowmode " don't show current mode
set backspace=indent,eol,start

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

set splitright

" mapping timeouts
" timeout on mapping after 500ms - should be slower than you usually type
" timeout on key codes after 100ms - should be faster than you can type
set timeout
set timeoutlen=500
set ttimeoutlen=100
" }}}

" {{{ Tabbing and indenting
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
" }}}

" {{{  Searching
set hlsearch " highlight as you search
set incsearch " scroll as you search
set ignorecase " searches are case-insensitive
set smartcase " unless they contain upper-case letters
if executable('rg')
  let grepprg="rg --vimgrep"
endif
" }}}

" {{{ File Types
"   {{{  Python
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
"   }}}

"   Bash {{{
let g:is_bash = 1 " Default ft-sh-syntax to bash mode
let g:sh_fold_enabled = 1 " Bash folds at functions
"   }}}

"   Gradle {{{
au BufNewFile,BufRead *.gradle set ft=groovy syntax=groovy
"   }}}

"   Ruby {{{
" Ruby is an oddball in the family, use special spacing/rules
if v:version >= 703
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal norelativenumber nocursorline
endif
"   }}}

"   Ansible {{{
let g:ansible_extra_keywords_highlight = 1
let g:ansible_attribute_highlight = "ab"
let g:ansible_doc_mapping = ';ad'
"   }}}

"   Go {{{
let g:go_fmt_autosave = 1
autocmd BufWritePre *.go call go#fmt#Format(1)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i <Plug>(go-imports)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
"   }}}

"   Markdown {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'yaml', 'xml', 'json']
"let g:markdown_minlines = 100
"   }}}

"   Vim {{{
let g:autoclose_vim_commentmode = 1
"   }}}

" {{{ Terraform
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1
autocmd FileType terraform setlocal commentstring=//%s
" }}}
" }}}

" {{{  Buffers
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
map <leader>fw :w! !sudo tee %<cr><cr>:e<cr>

"Setup a cmd to edit a file in the pwd
map <leader>e :e <c-r>=expand('%:p:h')<cr>/

"Buffer Explorer
nnoremap <F5> :BufExplorer<cr>
" }}}

" {{{  Spelling
set spellfile=~/.vim/spell-en.utf-8.add
function! ToggleSpelling()
  set spell!
endfunction
nnoremap zn ]s
nnoremap zN [s
nnoremap <leader>s :call ToggleSpelling()<CR>
" }}}

" {{{  Misc
" Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Paste toggle
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

" Wrap toggle
nnoremap <F9> :set wrap!<cr>
inoremap <F9> <esc>:set wrap!<cr>a

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

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
" }}}

" {{{  Cope (:h cope)
map <leader>cf :botright cope<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
" }}}

" {{{  Auto Commands
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when in a git/svn commit message.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && expand('%Y') != 'COMMIT_EDITMSG' |
    \   exe "normal g`\"" |
    \ endif
endif
" }}}

" {{{  airline
let g:airline_theme = 'solarized'
let g:airline_solarized_normal_green = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr= 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" {{{  Colorscheme
set termguicolors
silent! colorscheme polar " Silence errors in case it isn't installed yet
"highlight clear SignColumn " SignColumn matches the background
silent! call togglebg#map("<F10>")
" }}}

" {{{  NerdTree
nnoremap <F6> :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 35
let gNERDTreeShowLineNumbers = 1
" }}}

" {{{  Undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 50
let g:undotree_DiffpanelHeight = 15
nnoremap <F3> :UndotreeToggle<cr>
" }}}

" {{{  TagBar
"tags - directory of current file, then search up from working dir
set tags=./tags,tags;
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_compact=1
let g:tagbar_autoclose=1
" }}}

" {{{  Completion
let g:neocomplcache_enable_cursor_hold_i = 1 " Automatically popup after a delay
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
if exists('g:spf13_map_cr_omni_complete')
    inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

function! CleverCr()
  if pumvisible()
    return neocomplcache#close_popup()
  else
    return "\<CR>"
  endif
endfunction
" <CR> close popup and save indent or expand snippet
imap <expr> <CR> CleverCr()

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"set completeopt=menu,preview,longest
set completeopt=menu,preview

" Enable OmniCompletion
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}

" {{{  trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap <leader>ff :FixWhitespace<cr>
inoremap <leader>ff <esc>:FixWhitespace<cr>a
" }}}

" vim: set ft=vim ts=2 sw=2 tw=78 foldmethod=marker :
