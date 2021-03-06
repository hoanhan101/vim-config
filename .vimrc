"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   .vimrc - Vim configs file 
"   Author: Hoanh An (hoanhan101@gmail.com)
"   Date: 1/13/17 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime     

" Vundle - Plugins/Bundles Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" List of plugins and bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-system-copy'
Plugin 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" Plugins for a distraction-free writing env
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'

" All of the plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugins configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding
set foldmethod=indent
set foldlevel=79

let g:SimpylFold_docstring_preview=1

" Enable folding with the spacebar
nnoremap <space> za

" YouCompleteMe - auto-complete 
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Color scheme
syntax enable
" colorscheme dracula
hi QuickFixLine cterm=None ctermbg=256 guibg=#ffff00

" Rebind <Leader> key
let mapleader = ","

" Hide .pyc file in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <Leader>t :NERDTreeToggle<CR>

" Powerline
set laststatus=2

" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" History
set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set encoding to UTF8
set encoding=utf-8

" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse
set mouse=a

" Showing line numbers
set number

" Automatic word wrapping
set tw=79

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Split screen
set splitbelow
set splitright

" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <Leader>w :w!<CR>

" :W sudo saves the file 
command W w !sudo tee % > /dev/null

" Disable backup and swap files 
set nobackup
set nowritebackup
set noswapfile

" Disable <Press Enter...> prompt
set shortmess=a
set cmdheight=2

" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<cr>

" Automatically turn spell checking on these files below
" autocmd FileType markdown,go setlocal spell

" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Permanent undo. Use with caution.
" set undodir=~/.vimdid
" set undofile

" Make backspace work
set backspace=indent,eol,start
