"hi LineNr term=bold cterm=bold ctermfg=1 guifg=Grey guibg=Grey90
set nocompatible			  " be iMproved, required
filetype off				  " required
"command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"PLUGINS"
"--------------- 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'majutsushi/tagbar'
"Plugin 'fisadev/FixedTaskList.vim'		" Pending tasks list
"Plugin 'rosenfeld/conque-term'			" Consoles as buffers
"Plugin 'tpope/vim-surround'

"Plugin 'garbas/vim-snipmate'			" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'				" dependencies #2
"Plugin 'honza/vim-snippets'				" snippets repo

"Plugin 'klen/python-mode'				" Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'			" Jedi-vim autocomplete plugin
Plugin 'Shougo/neocomplete.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'ervandew/supertab'
Plugin 'xuhdev/vim-latex-live-preview'
call vundle#end()
filetype plugin indent on

"Airline settings
"---------------
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

"Neocomplete settings
"---------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

"Go settings
"---------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:ho_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_disable_autoinstall = 0

"Python settings
"---------------
let python_highlight_all=1	  

"Indent settings
"---------------
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"Other
"---------------
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:livepreview_previewer = 'zathura'

"Custom settings
"---------------
runtime! archlinux.vim

setlocal spelllang=ru
nnoremap <F2> :set spell<Enter>
nnoremap <F3> :set spell!<Enter>
"nnoremap <S-v> <c-v> " remapping visual block to shift-v

set laststatus=2
set noshowmode
set ignorecase
set tabstop=4 softtabstop=4 shiftwidth=4
set noshowmode
"autocmd Filetype python setlocal expandtab tabstop=0 shiftwidth=0 softtabstop=0
autocmd! bufreadpost * set noexpandtab | retab! 4
autocmd! bufwritepre * set expandtab | retab! 4
autocmd! bufwritepost * set noexpandtab | retab! 4
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  
"set number
set autoindent
set relativenumber
set updatetime=300
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
colorscheme pablo
filetype plugin on			  
filetype plugin indent on
syntax on
