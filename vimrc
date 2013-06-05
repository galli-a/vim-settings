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
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-characterize'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/gitv'
Bundle 'voithos/vim-python-matchit'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'amdt/sunset'
Bundle 'krisajenkins/vim-projectlocal'
Bundle 'roman/golden-ratio'
Bundle 'ervandew/supertab'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'finbarrocallaghan/highlights.vim'
Bundle 'dhruvasagar/vim-table-mode.git'
Bundle 'sjbach/lusty.git'
Bundle 'galli-a/my_powerline_theme'
Bundle 'galli-a/DirDiff.vim'
Bundle 'galli-a/Rainbow-Parentheses-Improved-and2'
" vim-script repos
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'vim-scripts/kwbdi.vim'
Bundle 'vim-scripts/taglist.vim'
"Bundle 'vim-scripts/DirDiff.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/bufexplorer.zip'
"Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
Bundle 'vim-scripts/Figlet.vim'

" non github repos
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" end setting up Vundle

filetype plugin indent on

" add window title
set title

" allow hidden buffers
set hidden

" Explicitly tell vim that the terminal supports 256 colors
set t_Co=256 

" ???
set modelines=0

" wrap lines, only at word boundaries
set wrap
set linebreak
" move vertically by screen line instead of real lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" load solarized color scheme
" set dark background
if has("gui_running")
	set background=dark
else
	set background=dark
endif
" enable syntax
syntax enable
" use transparent background if necessary
let g:solarized_termtrans = 1
" set diffmode
let g:solarized_diffmode = "high"
" load color scheme
colorscheme solarized
" bind F5 to toggle background color
"call togglebg#map("<F5>")

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
let g:Powerline_theme="mio_tema"
let g:Powerline_colorscheme="solarized256"
let g:Powerline_symbols="fancy"

" set minimum number of visible lines above and below the cursos
set scrolloff=3

" display text even when paragraph exits the screen
set display=lastline

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
nmap <silent> <Leader>sv :source $MYVIMRC<CR>:noh<CR>
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
nnoremap <leader><space> :nohlsearch<CR>

" show invisible characters
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
if has("unix")
	set listchars=tab:➟\ ,eol:⤦
	set showbreak=…
else
	set listchars=tab:→\ ,eol:▼
	set showbreak=…
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
"au FocusLost * :wa

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
"" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
	"if exists("t:expl_buf_num")
		"let expl_win_num = bufwinnr(t:expl_buf_num)
		"if expl_win_num != -1
			"let cur_win_nr = winnr()
			"exec expl_win_num . 'wincmd w'
			"close
			"exec cur_win_nr . 'wincmd w'
			"unlet t:expl_buf_num
		"else
			"unlet t:expl_buf_num
		"endif
	"else
		"exec '1wincmd w'
		"Vexplore
		"let t:expl_buf_num = bufnr("%")
	"endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" set paragraph formatting through external command
set formatprg=par\ -w80rgeq

" quick toggle spell checking
map <silent> <leader>sc :set spell!<CR>

" set default language to Italian, with English as second language
set spelllang=it,en_us

" change map for ctrlP package
let g:ctrlp_map = "<F7>"
let g:ctrlp_cmd = "CtrlPMixed"

" Show syntax highlighting groups for word under cursor
nmap <C-S-h> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" change behavior of gV to take into account cut and pasted text
nmap gV `[v`]

" Bubble text movements
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" quickly regenerate tags list
nnoremap <F2> :!ctags -R<CR>

" set window size at startup
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=35 columns=140
endif

"" quickly call tabularize plugin on visual selection
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"function! s:align()
  "let p = '^\s*|\s.*\s|\s*$'
  "if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    "let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    "let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    "Tabularize/|/l1
    "normal! 0
    "call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  "endif
"endfunction

" go up a level in fugutive tree representation
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" quick toggle TagList
nnoremap <C-S-F3> :TlistToggle<CR>
" put Taglist window on the right
let Tlist_Use_Right_Window=1

" sunset configuration
let g:sunset_latitude = 45.66
let g:sunset_longitude = 8.73
let g:sunset_utc_offset = 1 " no DST
" let g:sunset_utc_offset = 2 " DST
let g:loaded_sunset = 1 " disable plugin
function! g:sunset_daytime_callback()
	if exists(":PowerlineReloadColorscheme")
		let g:Powerline_colorscheme = "solarized"
		PowerlineReloadColorscheme
		":source $MYVIMRC<CR>:noh<CR>
	endif
	set background=light
endfunction
function! g:sunset_nighttime_callback()
	if exists(":PowerlineReloadColorscheme")
		let g:Powerline_colorscheme = "solarized256"
		PowerlineReloadColorscheme
		":source $MYVIMRC<CR>:noh<CR>
	endif
	set background=dark
endfunction
" function to quickly call the sunset callbacks
function! g:toggle_sunset()
	if &background=="dark"
		call g:sunset_daytime_callback()
	else
		call g:sunset_nighttime_callback()
	endif
endfunction
" map <F5> to toggle sunset settings
map <silent> <F5> :call g:toggle_sunset()<CR>
map! <silent> <F5> <C-O>:call g:toggle_sunset()<CR>

" map <F8> to backtick
noremap <F8> <Char-0x60>
inoremap <F8> <Char-0x60>

" folding settings
set foldmethod=indent
set foldcolumn=4
set nofoldenable
nnoremap <space> za

" link unnamed register to system clipboard
"set clipboard=unnamed

" function to redirect to a variable or a register the output of a command
"
" Called with a command and a redirection target
"   (see `:help redir` for info on redirection targets)
" Note that since this is executed in function context,
"   in order to target a global variable for redirection you must prefix it with `g:`.
" EG call Redir('ls', '=>g:buffer_list')
funct! Redir(command, to)
  exec 'redir '.a:to
  exec a:command
  redir END
endfunct
" The last non-space substring is passed as the redirection target.
" EG
"   :R ls @">
"   " stores the buffer list in the 'unnamed buffer'
" Redirections to variables or files will work,
"   but there must not be a space between the redirection operator and the variable name.
" Also note that in order to redirect to a global variable you have to preface it with `g:`.
"   EG
"     :R ls =>g:buffer_list
"     :R ls >buffer_list.txt
command! -nargs=+ R call call(function('Redir'), split(<q-args>, '\s\(\S\+\s*$\)\@='))

" map ctrl-space to omnicompletion
imap <c-space> <c-x><c-o>
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
setlocal omnifunc=syntaxcomplete#Complete

" options for the Figlet plugin
let g:figletFont='slant'

" add additional text objects to use as delimiters
let pairs = [ ".", ":", "<bar>", "/", "<bslash>", "*" , "_"]
for key in pairs
	execute "nnoremap ci".key." T".key."ct".key
	execute "nnoremap di".key." T".key."dt".key
	execute "nnoremap yi".key." T".key."yt".key
	execute "nnoremap vi".key." T".key."vt".key
	execute "nnoremap ca".key." F".key."cf".key
	execute "nnoremap da".key." F".key."df".key
	execute "nnoremap ya".key." F".key."yf".key
	execute "nnoremap va".key." F".key."vf".key
endfor

" Syntastic
if has("unix")
	let g:syntastic_error_symbol = '✗✗'
	let g:syntastic_style_error_symbol = '✠✠'
	let g:syntastic_warning_symbol = '∆∆'
	let g:syntastic_style_warning_symbol = '≈≈'
else
	let g:syntastic_error_symbol = 'XX'
	let g:syntastic_style_error_symbol = 'oo'
	let g:syntastic_warning_symbol = '∆∆'
	let g:syntastic_style_warning_symbol = '≈≈'
end

" supertab
let g:SuperTabDefaultCompletionType = "context"

" use two spaces between sentences
set cpoptions+=J

" suppress LustyExplorer ruby warning for sysytems without ruby support
let g:LustyExplorerSuppressRubyWarning = 1

" quickly toggle between absolute and relative line numbers
nnoremap <silent> <S-F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
