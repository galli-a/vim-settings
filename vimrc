" prevent vi compatibility mode
set nocompatible

" uses vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" plugin list
"
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'galli-a/my_powerline_theme'

" vim-script repos

" non github repos

filetype plugin indent on



" allow hidden buffers
set hidden

" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256 

" ???
set modelines=0

" load solarized color scheme
" set dark background
if has('gui_running')
	set background=dark
else
	set background=dark
endif
" enable syntax
syntax enable
" use transparent background if necessary
let g:solarized_termtrans = 1
" load color scheme
colorscheme solarized
" bind F5 to toggle background color
call togglebg#map("<F5>")

" set font
if has("unix")
	set guifont=Inconsolata-dz\ for\ Powerline:h12
else
	set guifont=Consolas\ for\ Powerline\ FixedD:h12:cANSI
endif

" make windows transparent
if has("macunix")
	set transparency=5
end

" hide toolbar and menubar on windows
if has("win32") || has("win64")
	set guioptions-=m
	set guioptions-=T
end

" always show the status line
set laststatus=2
" set encoding to UTF-8
set encoding=utf-8

" powerline settings
let g:Powerline_theme="skwp_mio"
let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols='fancy'

" set minimum number of visible lines above and below the cursos
set scrolloff=3

" set automatic indentation
set autoindent

" show editing mode
set showmode
" show parameters
set showcmd

" add wildmenu
set wildmenu
set wildmode=list:longest,full

" quick edit .vimrc
nmap <silent> <leader>se :e $MYVIMRC<CR>
" quick reload .vimrc
nmap <silent> <Leader>sv :source $MYVIMRC<CR>

" highlight current line
set cursorline

" speed up scrolling
set ttyfast

" show ruler
set ruler

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" backspace also for indent end eol
set backspace=indent,eol,start

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" set relative line number
set relativenumber

" add undo file
set undofile

" enable syntax highlighting
syntax on

" fix regex
nnoremap / /\v
vnoremap / /\v
" add intelligent case search
set ignorecase
set smartcase
" set global substitution as default
set gdefault
" set search result highlighting as you type
set incsearch
set showmatch
set hlsearch
" clear search result highlight
nnoremap <leader><space> :noh<CR>

" show invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
if has("unix")
	set listchars=tab:➟\ ,eol:⤦
else
	set listchars=tab:→\ ,eol:▼
end

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" save on lost focus
au FocusLost * :wa

" quick access to gundo
nnoremap <F6> :GundoToggle<CR>

" set tabbing options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
