" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set relativenumber              "Relative numbers are better"
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ignorecase                  "Turn off case sensitivity

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=" "

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Navigation
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'

" Editing
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'alx741/yesod.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Syntax Highlighting
Plug 'purescript-contrib/purescript-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/applescript.vim'

" Initialize plugin system
call plug#end()

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable
set background=dark
color dracula

" For MacVim
set guifont=Monaco:h16

" fzf
set rtp+=/usr/local/opt/fzf
map <Leader>p <esc>:FZF<cr>

" NERDTree
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Reveal current file in NERDTree with <Leader>r
map <Leader>m <esc>:NERDTreeFind<cr>

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" gitgutter
let g:gitgutter_enable = 1

" ===== SYNTASTIC 
"mark syntax errors with :signs
" let g:syntastic_enable_signs = 1
"automatically jump to the error when saving the file
" let g:syntastic_auto_jump=0
"show the error list automatically
" let g:syntastic_auto_loc_list=1
