set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set number
set backspace=indent,eol,start
set autoread
set hidden
set virtualedit=onemore
set t_vb=
set visualbell
set noerrorbells
set showmatch
set wildmode=list:longest
set list listchars=tab:»-
set expandtab
set wrapscan

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup fileTypeFormat
    autocmd BufRead,BufNewFile *Dockerfile* setf Dockerfile
augroup END

set wildmenu
set history=5000
set incsearch
set ignorecase
set smartcase
set hlsearch

" Change highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundle')
  call dein#begin('$HOME/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Automatic completion of code
  call dein#add('Shougo/neocomplete.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('altercation/vim-colors-solarized')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Strengthened display of status line
  call dein#add('itchyny/lightline.vim')

  " Highlight the last double-byte and one-byte space character
  call dein#add('bronson/vim-trailing-whitespace')

  " Indent visualization
  call dein#add('Yggdroot/indentLine')

  " Lint
  call dein#add('w0rp/ale')

  " Complement Node.js
  call dein#add('mattn/jscomplete-vim')
  call dein#add('myhere/vim-nodejs-complete')

  " Indentation and syntax color of JS
  call dein#add('pangloss/vim-javascript')

  " React JSX syntax
  call dein#add('mxw/vim-jsx')

  " Go
  call dein#add('fatih/vim-go')

  " NERDTree
  call dein#add('scrooloose/nerdtree')

  " elzr/vim-json
  call dein#add('elzr/vim-json')

  " Required:
  call dein#end()
  call dein#save_state()

endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------

set background=dark
colorscheme solarized

"----------------------------------------------------------
" status line config
"----------------------------------------------------------
set laststatus=2
set showmode
set showcmd
set ruler

" ALE status customization
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified'],
  \    ['ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'ALEStatus'
  \}
\ }

function! ALEStatus()
  return ALEGetStatusLine()
endfunction

" Change the format of ALE's message
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Move between ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Enable NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

augroup Vimrc
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Prevent typo of Commit message
autocmd Vimrc VimEnter COMMIT_EDITMSG setlocal spell

" Complement Node.js
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1

"----------------------------------------------------------
" neocomplete / neosnippet config
"----------------------------------------------------------
" Enable neocomplete when starting Vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#auto_completion_start_length = 1
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"----------------------------------------------------------
" vim-go
"----------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"----------------------------------------------------------
" vim-json
"----------------------------------------------------------
let g:vim_json_syntax_conceal = 0
