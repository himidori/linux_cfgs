" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
"colo slate
"colorscheme default
"colorscheme pablo
hi LineNr term=bold cterm=bold ctermfg=1 guifg=Grey guibg=Grey90
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
"Plugin 'majutsushi/tagbar'
"Plugin 'fisadev/FixedTaskList.vim'     " Pending tasks list
"Plugin 'rosenfeld/conque-term'         " Consoles as buffers
"Plugin 'tpope/vim-surround'

"Plugin 'garbas/vim-snipmate'           " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
"Plugin 'tomtom/tlib_vim'               " dependencies #2
"Plugin 'honza/vim-snippets'                " snippets repo

"Plugin 'klen/python-mode'              " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'           " Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined' " Combined Python 2/3 for Vim
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fatih/vim-go'


let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:ho_highlight_operators = 1
let g:go_highlight_build_constraints = 1

call vundle#end()
filetype plugin on            
filetype plugin indent on
let python_highlight_all=1    
syntax on
let g:go_disable_autoinstall = 0
set tabstop=4 softtabstop=4 shiftwidth=4
autocmd! bufreadpost * set noexpandtab | retab! 4
autocmd! bufwritepre * set expandtab | retab! 4
autocmd! bufwritepost * set noexpandtab | retab! 4
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  
set number


" настройки Vim-Airline
"set laststatus=2
"let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

