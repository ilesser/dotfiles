"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Ignacio Lesser
"
" Version:
" 	1.0 - 28/07/19 18:51
"
" Basepoint:
" 	Initial configuration obtained from this page
" 	https://stsewd.dev/es/posts/neovim-plugins/
"
" Sections:
"       -> Vim-Plug
"       -> General
"       -> Colors and Fonts
"       -> Files and backups
"       -> Text, tab and indent related
"       -> Visual mode related
"       -> Moving around, tabs and buffers
"       -> Status line
"       -> Editing mappings
"       -> vimgrep searching and cope displaying
"       -> Spell checking
"       -> Misc
"       -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ------------------------------------------------------------------------------
" Vim-Plug
" ------------------------------------------------------------------------------
call plug#begin()
" --- Making Vim look good -----------------
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
" --- Vim as a programmer's text editor ----
Plug 'scrooloose/nerdcommenter' 
Plug 'scrooloose/nerdtree' 
Plug 'scrooloose/syntastic'   " error with python version
Plug 'pseewald/vim-anyfold'   " folding made easy
Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'     " Exhuberant ctags
Plug 'brooth/far.vim'         " Super search and replace
Plug 'jiangmiao/auto-pairs'   " Insert pais of quotes, brackets, etc
Plug 'machakann/vim-highlightedyank' " Highlight yank area 
Plug 'majutsushi/tagbar'      " Browse classes
" --- Working with Git ---------------------
"Plug 'airblade/vim-gitgutter' 
"Plug 'tpope/vim-fugitive' 
"Plug 'xuyuanp/nerdtree-git-plugin'
" --- Autocomplete -------------------------
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'Shougo/echodoc.vim'  " Show function signature
Plug 'ervandew/supertab'   " Use tabs to move around deoplete
Plug 'deoplete-plugins/deoplete-jedi' " Python autocompletion
Plug 'Shougo/neco-vim'     " Vim autocomplete 
"Plug 'roxma/nvim-completion-manager'
" --- Code snippets ------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" --- Linting ------------------------------
"Plug 'dense-analysis/ale'
"Plug 'neomake/neomake'
" --- Syntax highlight ---------------------
Plug 'sheerun/vim-polyglot'

call plug#end()
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  General
" ------------------------------------------------------------------------------
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
filetype plugin indent on
" Enable mouse on all modes
if has("mouse")
   set mouse=a
   set mousehide
endif
" Show line number
set number
" use system clipboard
set clipboard=unnamedplus
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Colors and Fonts
" ------------------------------------------------------------------------------
" Enable syntax highlighting
syntax enable
set termguicolors  " Activa true colors en la terminal
set background=dark  " Fondo del tema: dark/light
colorscheme NeoSolarized  " Activa tema NeoSolarized
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set guifont=Monospace:h13
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Files, backups and undo
" ------------------------------------------------------------------------------
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set autochdir
au BufRead,BufNewFile *.cmd set filetype=tcl
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Text, tab and indent related
" ------------------------------------------------------------------------------
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap! "Wrap lines
" Turn hybrid line numbers on
set number relativenumber
set nu rnu
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------
" Treat long lines as break lines (useful when moving around in them)
" With a map leader it's possible to do extra key combinations
let mapleader =" "
let g:mapleader =" " 
map j gj
map k gk
" Smart way to move between buffers
"map L gt
"map H gT
map H :bfirst<cr> 
map J :bprevious<cr> 
map K :bnext<cr>
map L :blast<cr> 
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/
" Close the current buffer
map <leader>q :bdelete<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" Exit
map <leader>x :qa<cr>
" Save
map <leader>w :w<cr>
" Remap VIM 0 to first non-blank character
map 0 ^
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Autocomplete
" ------------------------------------------------------------------------------
" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1
" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END
" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" ECHODOC
" ------------------------------------------------------------------------------
set noshowmode  " No mostrar el modo actual (echodoc hace uso de este espacio)
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  Code snippets
" ------------------------------------------------------------------------------
" Expandir snippet con Ctrl + j
let g:UltiSnipsExpandTrigger = '<c-j>'

" Ir a siguiente ubicacion con Ctrl + j
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
" Ir a anterior ubicacion con Ctrl + k
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  Nerdtree
" ------------------------------------------------------------------------------
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <leader>nt :NERDTree<CR>
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  Neomake
" ------------------------------------------------------------------------------
" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
"let g:neomake_python_enabled_makers = ['flake8']
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" vim-anyfold 
" ------------------------------------------------------------------------------
autocmd Filetype * AnyFoldActivate " activate for all file types
let g:anyfold_fold_comments=1
let g:anyfold_identify_comments=2
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" vim-fugitive
" ------------------------------------------------------------------------------
nmap <leader>gs :Git<CR>
nmap <leader>gs :Git diff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gj :diffget //3<CR> " Get from the right buffer
nmap <leader>gf :diffget //2<CR> " Get from the left  buffer

" ------------------------------------------------------------------------------
" vim-highlightedyank
" ------------------------------------------------------------------------------
hi HighlightedyankRegion cterm=reverse gui=reverse
" Set highlight duration time to 500 ms
let g:highlightedyank_highlight_duration = 500
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
" ------------------------------------------------------------------------------

