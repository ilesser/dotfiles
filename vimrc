" Basics {
set nocompatible        " Must be first line
set shell=/bin/bash
filetype off            " Required for Vundle
" }

" Vundle {

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Force conection to use git protocol
let g:vundle_default_git_proto='git'

" Vundle start
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 
" --- Making Vim look good -----------------
Plugin 'altercation/vim-colors-solarized' 
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
" --- Vim as a programmer's text editor ----
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree' 
Plugin 'scrooloose/syntastic.git' " error with python version
Plugin 'pseewald/vim-anyfold'    " folding made easy
Plugin 'Yggdroot/indentLine'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'      " Exhuberant ctags
" --- Working with Git ---------------------
Plugin 'airblade/vim-gitgutter' 
Plugin 'tpope/vim-fugitive' 

" All of the Plugins must be added before the following line 
call vundle#end()                   " required
filetype plugin indent on           " required
" }

" Palette {
if $COLORTERM == 'gnome-terminal'
   set t_Co=256                     " Enable 256 colors palette in Gnome Terminal
   let g:solarized_termcolors=256
endif
syntax enable                       " Syntax highlighting
set background=dark                 " Assume a dark background
colorscheme solarized
" }

" General {
set wildignore=*.o,*~,*.pyc         " Ignore compiled files
set ffs=unix,dos,mac                " Use Unix as the standard file type
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                         " Spell checking off
set hidden                          " Allow buffer switching without saving
set backup                          " Backups are nice ...
if has('persistent_undo')
   set undofile                     " So is persistent undo ...
   set undolevels=1000              " Maximum number of changes that can be undone
   set undoreload=10000             " Maximum number lines to save for undo on a buffer reload
endif
" }

" Vim UI {
set encoding=utf-8
set mouse=a                         " Automatically enable mouse usage
set mousehide                       " Hide the mouse cursor while typing
scriptencoding utf-8
if has('clipboard')
   set clipboard=unnamedplus
endif
set tabpagemax=15                   " Only show 15 tabs
set showmode                        " Display the current mode
set nocursorline                    " Highlight current line
highlight clear SignColumn          " SignColumn should match background
highlight clear LineNr              " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn']
highlight clear CursorLineNr        " Remove highlight color from current line number
if has('cmdline_info')
   set ruler                        " Show the ruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
   set showcmd                      " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
endif
if has('statusline')
   set laststatus=2
   " Broken down into easily includeable segments
   set statusline=%<%f\                     " Filename
   set statusline+=%w%h%m%r                 " Options
   set statusline+=\ [%{&ff}/%Y]            " Filetype
   set statusline+=\ [%{getcwd()}]          " Current dir
   set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start      " Backspace for dummies
set linespace=0                     " No extra spaces between rows
set nu                              " Line numbers on
set showmatch                       " Show matching brackets/parenthesis
set incsearch                       " Find as you type search
set hlsearch                        " Highlight search terms
set winminheight=0                  " Windows can be 0 line high
set ignorecase                      " Case insensitive search
set smartcase                       " Case sensitive when uc present
set wildmenu                        " Show list instead of just completing
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too
set scrolljump=3                    " Lines to scroll when cursor leaves screen
set scrolloff=3                     " Minimum lines to keep above and below cursor
set listchars=tab:.\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
set nowrap                          " Do not wrap long lines
set autoindent                      " Indent at the same level of the previous line
set shiftwidth=3                    " Use indents of 3 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=3                       " An indentation every four columns
set softtabstop=3                   " Let backspace delete indent
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vsplit windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set matchpairs+=<:>                 " Match, to be used with %
set pastetoggle=<F12>               " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/      " auto format comment blocks
" }

" Commands
source ~/.vim/commandsrc

" Key (re)Mappings
source ~/.vim/mappingsrc

" Functions definition
source ~/.vim/functionsrc

" Plugins configuration
source ~/.vim/pluginsrc
