filetype off
filetype plugin indent on

colorscheme bclear

set nocompatible                    "incompatible with vi
set encoding=utf-8                  "default file encoding
set nomodeline                      "vim mode lines at the top of a file; read 0 of them
set ttyfast                         "fast terminal mode (slow mode only updates certain lines)
set nobackup                        "don't use ~backup for overwriting a different file
set nowritebackup                   "don't use ~backup for saving the current file
set noswapfile                      "don't create a .swp file for the current file
set scrolloff=3                     "number of lines to keep on the screen top and bottom

set tabstop=4                       "number of spaces that a <tab> character in a file counts for
set shiftwidth=4                    "number of spaces for autoindent
set softtabstop=4                   "number of spaces for a <tab> keyboard key counts for
set expandtab                       "change tabs to spaces
set autoindent                      "automatically indent codes
set wrap                            "line wraping
set backspace=indent,eol,start      "what is allowed to be backspaced
set formatoptions=qrn1              "formatting options
                                    "q: allow formatting of comments with gq
                                    "n: recognize numbered lists and wordwrap with indents
                                    "r: automatically insert coment leader with enter
                                    "1: don't break a line after a 1-letter word

set showmode                        "show the mode at the bottom of the window
set showcmd                         "show the command keys as you're typing them
set ruler                           "always show cursor position
set laststatus=2                    "status line for the last window

set ignorecase                      "searches are case insensitive
set smartcase                       "unless there is a capital letter in the search string
set gdefault                        "in s(ubstitute) commands, g is on by default
set history=1000                    "command history size
set undolevels=1000                 "number of times to track undos
set hidden                          "allow switching buffers without writing to disk
set incsearch                       "show the first match as it's typed
set showmatch                       "briefly blink the matching bracket as the closing one is typed
set hlsearch                        "highlight all previous search matches

set wildmenu                        "enhanced command line completion mode
set wildmode=list:longest           "how to display the compltion options

"quick keys
set pastetoggle=<F2>
noremap <F1> <esc>
inoremap <F1> <esc>
let mapleader = ","

"load all plugins <pathogen>
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"search with magic! (very magic)
vnoremap / /\v
nnoremap / /\v
nnoremap <leader><space> :noh<cr>

"tab to indent, reselect if there was a selection
nnoremap <tab> V>
nnoremap <s-tab> V<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
inoremap <s-tab> <esc>V<A

"move text up and down
nnoremap <c-up> :m-2<CR>
nnoremap <c-down> :m+<CR>
vnoremap <c-up> :m-2<CR>gv
vnoremap <c-down> :m'>+<CR>gv

"select all text, like ctrl-a
nnoremap <leader>a ggVG
vnoremap <leader>a <esc>ggVG

"make Y behave like C and D (perform action until the end of the line)
nnoremap Y y$

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"make x,X,<del> avoid overwriting registers
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap <del> "_x
vnoremap <del> "_x

"open an edit path with the current file's directory autofilled
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>cd :cd <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>cp :cd /Volumes/jtomsi01/www/

"t-comment to comment (and reselect if commenting from v mode)
vnoremap <leader>/ :TComment<cr>gv
nnoremap <leader>/ :TComment<cr>

"j/k should go up/down through VISIBLE lines, even if real lines wrap.
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"list things
nnoremap <leader>rl :registers<cr>
nnoremap <leader>lr :registers<cr>
nnoremap <leader>ml :marks<cr>
nnoremap <leader>lm :marks<cr>

"buffer commands <ctrlp>
nnoremap <F12> :bn<cr>
nnoremap <s-F12> :bp<cr>
nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>
nnoremap <leader>q :bd<cr>

nnoremap <c-F12> :CtrlPBuffer<cr>
nnoremap <leader>bl :CtrlPBuffer<cr>
nnoremap <leader>lb :CtrlPBuffer<cr>

"undo visualization <gundo>
nnoremap <leader>u :GundoToggle<cr>

"auto-completion <neocomplcache>
set completeopt=longest,menuone,preview
inoremap <expr><c-space> neocomplcache#start_manual_complete()
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_enable_underbar_completion = 1

"tags for projects and files <ctags, tlist>
set tags=./tags,tags;/
nnoremap <leader>tl :Tlist<cr>
nnoremap <leader>lt :Tlist<cr>

noremap <s-up> <up>
noremap <s-down> <down>
noremap <s-left> <left>
noremap <s-right> <right>

"find a file by contents <ack>
nnoremap <F3> :Ack 
nnoremap <leader>fa :Ack 
let g:ackprg="ack -H --nocolor --nogroup --column --type-add php=.tpl"

"find a file by name <ctrlp>
nnoremap <F4> :CtrlP<cr>
nnoremap <leader>fn :CtrlP<cr>
let g:ctrlp_working_path_mode = 0

"navigate to file directly <nerd-tree>
nnoremap <F5> :NERDTreeToggle<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
