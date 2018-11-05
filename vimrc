" general
filetype plugin indent on
syntax on
set nocompatible			  " be iMproved, required
filetype off				  " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'dracula/vim'
Plugin 'marcopaganini/termschool-vim-theme'
"Plugin 'python-mode/python-mode'
"Plugin 'majutsushi/tagbar'
"Plugin 'fisadev/FixedTaskList.vim'		" Pending tasks list
"Plugin 'rosenfeld/conque-term'			" Consoles as buffers
"Plugin 'tpope/vim-surround'


"Plugin 'klen/python-mode'				" Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
"Plugin 'davidhalter/jedi-vim'			" Jedi-vim autocomplete plugin
Plugin 'Shougo/neocomplete.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'ervandew/supertab'
Plugin 'xuhdev/vim-latex-live-preview' 
Plugin 'joshdick/onedark.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'fenetikm/falcon'
call vundle#end()

" Theme
" colorscheme onedark
set t_Co=256
"set background=dark
colorscheme base16-tomorrow-night
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
autocmd VimEnter * hi Pmenu ctermbg=none
autocmd VimEnter * hi PmenuSel ctermfg=black
autocmd VimEnter * hi StatusLine ctermbg=none ctermfg=red
autocmd VimEnter * hi StatusLineNC ctermbg=none
autocmd VimEnter * hi VertSplit ctermbg=none ctermfg=red
autocmd VimEnter * hi Visual ctermbg=red ctermfg=black

" Airline 
"let g:airline_theme='raven'
"let g:airline_powerline_fonts = 1
"let g:airline_section_y = ''
"let g:airline#extensions#tabline#enabled = 1

"autocmd VimEnter * AirlineToggleWhitespace

" Neocomplete 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

"Go 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:ho_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_disable_autoinstall = 0

" Python 
" let python_highlight_all=1	  

" Indent 
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '│'

" Indent
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set expandtab 


" Other
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:livepreview_previewer = 'zathura'

runtime! archlinux.vim

setlocal spelllang=ru
nnoremap <F2> :set spell<Enter>
nnoremap <F3> :set spell!<Enter>
"nnoremap <S-v> <c-v> " remapping visual block to shift-v

set laststatus=2
set noshowmode
set ignorecase
set noshowmode
"autocmd Filetype python setlocal expandtab tabstop=0 shiftwidth=0 softtabstop=0
autocmd! bufreadpost * set noexpandtab | retab! 4
autocmd! bufwritepre * set expandtab | retab! 4
autocmd! bufwritepost * set noexpandtab | retab! 4
map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeClose<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  
" set number
"set relativenumber
" set number
set updatetime=300
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
