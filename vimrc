" prevent vi compatibility mode
set nocompatible

" set encoding to UTF-8
set encoding=utf-8

" uses vundle
filetype off
" Setting up Vundle
let iCanHazVundle=1
set shellxquote=""
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif
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
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'galli-a/my_powerline_theme'

" vim-script repos

" non github repos
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" end setting up Vundle

filetype plugin indent on



" allow hidden buffers
set hidden

" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256 

" ???
set modelines=0

" wrap lines, only at word boundaries
set wrap
set linebreak

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

" set leader key
let mapleader="\\"

" quick edit .vimrc
nmap <silent> <Leader>se :e $MYVIMRC<CR>
" quick reload .vimrc
nmap <silent> <Leader>sv :source $MYVIMRC<CR>
" quick edit full configuration file
nmap <silent> <Leader>ss :e $HOME/vim-settings/vimrc<CR>

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

" reload modified files
set autoread

" save on lost focus
au FocusLost * :wa

" quick access to gundo
nnoremap <F6> :GundoToggle<CR>

" quick access to NERDTree
nnoremap <leader>nt :NERDTreeToggle %:p:h<CR>

" set tabbing options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" configure quick access to YankRing
nnoremap <silent> <F4> :YRShow<cr>
inoremap <silent> <F4> <ESC>:YRShow<cr>

" 
"
" " set netrw options
" let g:netrw_liststyle=3 " user tree-mode as default view
" let g:netrw_browse_split=4 " open file in previous buffer
" let g:netrw_preview=1 " preview window shown in a vertical split
" let g:netrw_winsize=30 " limit preview window to 80%
" let g:netrw_altv=1
" 
" " Toggle Vexplore with Ctrl-E
" function! ToggleVExplorer()
"   if exists("t:expl_buf_num")
"       let expl_win_num = bufwinnr(t:expl_buf_num)
"       if expl_win_num != -1
"           let cur_win_nr = winnr()
"           exec expl_win_num . 'wincmd w'
"           close
"           exec cur_win_nr . 'wincmd w'
"           unlet t:expl_buf_num
"       else
"           unlet t:expl_buf_num
"       endif
"   else
"       exec '1wincmd w'
"       Vexplore
"       let t:expl_buf_num = bufnr("%")
"   endif
" endfunction
" map <silent> <C-E> :call ToggleVExplorer()<CR>
