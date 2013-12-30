" prevent vi compatibility mode {{{
set nocompatible
" }}}

" set encoding to UTF-8 {{{
set encoding=utf-8
" }}}

" vundle settings {{{
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
Bundle 'mileszs/ack.vim' " use ack - td
Bundle 'sjl/gundo.vim' " visualize undo tree
Bundle 'altercation/vim-colors-solarized' " solarized color scheme
Bundle 'tpope/vim-surround' " add surround action
Bundle 'tpope/vim-repeat' " enables repeat for plugin maps
Bundle 'tpope/vim-unimpaired' " handy brackets mappings - td
Bundle 'tpope/vim-fugitive' " git wrapper
Bundle 'tpope/vim-abolish.git' " easily define abbreviation and substitutions, including case variants
Bundle 'tpope/vim-characterize' " unicode character metadata
Bundle 'tpope/vim-commentary' " toggle comments
Bundle 'scrooloose/nerdtree' " filesystem explorer
Bundle 'scrooloose/syntastic' " display results from external syntax checker
Bundle 'kien/ctrlp.vim' " fuzzy file and buffer finder
Bundle 'godlygeek/tabular' " align text with regex
Bundle 'gregsexton/gitv' " shows git repository history
Bundle 'voithos/vim-python-matchit' " makes % cycle through python block definitions
Bundle 'michaeljsmith/vim-indent-object' " defines text object representing lines of code at the same indentation level
Bundle 'amdt/sunset' " automatically changes backroung based on sunrise/sunset
Bundle 'krisajenkins/vim-projectlocal' " lets you set up project-specific .vimrc files
Bundle 'roman/golden-ratio' " resizes focussed window to increase readability
Bundle 'ervandew/supertab' " allows use ot <Tab> for all completion
Bundle 'nelstrom/vim-visual-star-search' " use * also in visual mode
Bundle 'finbarrocallaghan/highlights.vim' " adds additional highlighting groups - td
Bundle 'dhruvasagar/vim-table-mode.git' " automatic table creator and formatter
Bundle 'sjbach/lusty.git' " file and buffer explorer - td
Bundle 'bling/vim-airline' " statusbar replacement
Bundle 'christoomey/vim-tmux-navigator' " allows navigating between vim and tmux splits
Bundle 'chrisbra/csv.vim' " better viewing of csv files
Bundle 'justinmk/vim-sneak' " move to location specified by two characters
Bundle 'arecarn/crunch' " easier calculations
Bundle 'dahu/LearnVim' " help for learning vim
Bundle 'sk1418/HowMuch' " calculate visually selected expressions
Bundle 'bruno-/vim-vertical-move' " moves vertically as far as possible without changing column
Bundle 'mattn/calendar-vim' " creates calendar window
Bundle 'mhinz/vim-signify' " use signs to indicate modified lines, based on vcs
Bundle 'galli-a/DirDiff.vim' " recursive diff on two directories
Bundle 'galli-a/Rainbow-Parentheses-Improved-and2' " different color for different levels of nested parentheses
Bundle 'galli-a/persistentvisuals' " retain visual selection after certain operations
Bundle 'galli-a/listtrans' " toggles between a comma separated list of words and a bulleted list
Bundle 'galli-a/vmath' " math operations on a column of numbers
Bundle 'galli-a/dragvisuals' " allows dragging of visual blocks
" vim-script repos
Bundle 'vim-scripts/YankRing.vim' " maintains list of previous yanks, changes and deletes
Bundle 'vim-scripts/ZoomWin' " toggles between split and fullscreen window
Bundle 'vim-scripts/scratch.vim' " create and use scratch buffer - td
Bundle 'vim-scripts/hexHighlight.vim' " highlights hex codes with their color
Bundle 'vim-scripts/kwbdi.vim' " keep window on buffer delete
Bundle 'vim-scripts/taglist.vim' " source code browser, uses ctags
"Bundle 'vim-scripts/DirDiff.vim'
Bundle 'vim-scripts/matchit.zip' " extends % to blocks in other programming languages
Bundle 'vim-scripts/bufexplorer.zip' " easier buffer navigation
"Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
Bundle 'vim-scripts/Figlet.vim' " use figlet inside vim
Bundle 'vim-scripts/vis' " performs Ex commands only on visually selected region

" non github repos
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" end setting up Vundle

filetype plugin indent on
" }}}

" add window title {{{
set title
" }}}

" allow hidden buffers {{{
set hidden
" }}}

" Explicitly tell vim that the terminal supports 256 colors {{{
set t_Co=256 
" }}}

" ??? {{{
set modelines=0
" }}}

" wrap lines, only at word boundaries {{{
set wrap
set linebreak
" }}}

" move vertically by screen line instead of real lines {{{
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}

" solarized color scheme {{{
" set dark background
if has("gui_running")
	set background=dark
else
	set background=dark
endif
" enable syntax
syntax enable
" set use of 256 colors
let g:solarized_termcolors = 16
" set visibility high
"let g:solarized_visibility = "high"
" set contrast high
let g:solarized_contrast = "high"
" use transparent background if necessary
let g:solarized_termtrans = 1
" set diffmode
let g:solarized_diffmode = "high"
" load color scheme
colorscheme solarized
" bind F5 to toggle background color
"call togglebg#map("<F5>")
" }}}

" set font {{{
if has("unix")
	set guifont=Inconsolata-dz\ for\ Powerline:h12
else
	set guifont=Sauce\ Code\ Powerline:h12:cANSI
endif
" }}}

" make windows transparent {{{
if has("macunix")
	set transparency=5
end
" }}}

" hide toolbar and menubar on windows {{{
if has("win32") || has("win64")
	set guioptions-=m
	set guioptions-=T
end
" }}}

" set external grep program to grep on windows {{{
if has("win32") || has("win64")
	set grepprg=grep\ -nH
end
" }}}

" status line {{{
" always show the status line
set laststatus=2

" show editing mode
set showmode
" show parameters
set showcmd

" show ruler
set ruler

" airline settings {{{
" make airline use powerline fonts
let g:airline_powerline_fonts = 1
" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
" remove arrowtips
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline_theme='solarized'
" }}}
" }}}

" set minimum number of visible lines above and below the cursos {{{
set scrolloff=3
" }}}

" display text even when paragraph exits the screen {{{
set display=lastline
" }}}

" set indentation {{{
set autoindent
" }}}

" add wildmenu {{{
set wildmenu
set wildmode=list:longest,full
" }}}

" leader {{{
" set leader key
let mapleader="\\"
" set localleader key
let maplocalleader="_"
" }}}

" quick edit .vimrc {{{
nmap <silent> <Leader>se :e $MYVIMRC<CR>
" quick reload .vimrc
nmap <silent> <Leader>sv :source $MYVIMRC<CR>:noh<CR>
" quick edit full configuration file
nmap <silent> <Leader>ss :e $HOME/vim-settings/vimrc<CR>
" }}}

" highlight current line {{{
set cursorline
" }}}

" speed up scrolling {{{
set ttyfast
" }}}

" Yank text to the OS X clipboard {{{
noremap <leader>y "*y
noremap <leader>yy "*Y
" }}}

" backspace also for indent end eol {{{
set backspace=indent,eol,start
" }}}

" Preserve indentation while pasting text from the OS X clipboard {{{
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" }}}

" add undo file {{{
set undofile
" }}}

" enable syntax highlighting {{{
syntax on
" }}}

" search {{{
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
" }}}

" invisible characters {{{
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
if has("unix")
	set listchars=tab:➟\ ,eol:⤦,trail:·
	set showbreak=…
else
	set listchars=tab:→\ ,eol:▼,trail:·
	set showbreak=.
end
" }}}

" disable arrow keys {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" except in visual mode
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
" }}}

" reload modified files {{{
set autoread
" }}}

" Gundo {{{
nnoremap <F6> :GundoToggle<CR>
" }}}

" NERDTree {{{
nnoremap <leader>nt :NERDTreeToggle %:p:h<CR>
" }}}

" set tabbing options {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" }}}

" YankRing {{{
nnoremap <silent> <F4> :YRShow<cr>
inoremap <silent> <F4> <ESC>:YRShow<cr>
" }}}

" netrw {{{
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
			"execute expl_win_num . 'wincmd w'
			"close
			"execute cur_win_nr . 'wincmd w'
			"unlet t:expl_buf_num
		"else
			"unlet t:expl_buf_num
		"endif
	"else
		"execute '1wincmd w'
		"Vexplore
		"let t:expl_buf_num = bufnr("%")
	"endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>
" }}}

" DiffOrig {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vertical new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}

" set paragraph formatting through external command {{{
set formatprg=par\ -w80rgeq
" }}}

" spell checking {{{
" quick toggle spell checking
map <silent> <leader>sc :set spell!<CR>

" set default language to Italian, with English as second language
set spelllang=it,en_us
" }}}

" change map for ctrlP package {{{
let g:ctrlp_map = "<F7>"
let g:ctrlp_cmd = "CtrlPMixed"
" }}}

" Show syntax highlighting groups for word under cursor {{{
nmap <C-S-h> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" change behavior of gV to take into account cut and pasted text {{{
nmap gV `[v`]
" }}}

" Bubble text movements {{{
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" }}}

" set window size at startup {{{
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=35 columns=140
endif
" }}}

" tabulrize settings {{{
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
" }}}

" fugitive autocommands {{{
augroup fugitive_au
	autocmd!
	" go up a level in fugitive tree representation
	autocmd User fugitive
	  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	  \   nnoremap <buffer> .. :edit %:h<CR> |
	  \ endif

	" auto-clean fugitive buffers
	autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
" }}}

" tags {{{
" quickly regenerate tags list
nnoremap <F2> :!ctags -R<CR>
" quick toggle TagList
nnoremap <C-S-F3> :TlistToggle<CR>
" put Taglist window on the right
let Tlist_Use_Right_Window=1
" }}}

" sunset configuration {{{
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
" }}}

" map <F8> to backtick {{{
noremap <F8> <Char-0x60>
inoremap <F8> <Char-0x60>
cnoremap <F8> <Char-0x60>
" }}}

" folding settings {{{
set foldmethod=indent
set foldcolumn=4
set nofoldenable
nnoremap <space> za
" }}}

" function to redirect to a variable or a register the output of a command {{{
"
" Called with a command and a redirection target
"   (see `:help redir` for info on redirection targets)
" Note that since this is executed in function context,
"   in order to target a global variable for redirection you must prefix it with `g:`.
" EG call Redir('ls', '=>g:buffer_list')
function! Redir(command, to)
  execute 'redir '.a:to
  execute a:command
  redir END
endfunction
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
" }}}

" map ctrl-space to omnicompletion {{{
imap <c-space> <c-x><c-o>
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
setlocal omnifunc=syntaxcomplete#Complete
" }}}

" options for the Figlet plugin {{{
let g:figletFont='slant'
" }}}

" add additional text objects to use as delimiters {{{
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
" }}}

" Syntastic settings {{{
if has("unix")
	let g:syntastic_error_symbol = '✗✗'
	let g:syntastic_style_error_symbol = '✠✠'
	let g:syntastic_warning_symbol = '∆∆'
	let g:syntastic_style_warning_symbol = '≈≈'
else
	let g:syntastic_error_symbol = 'XX'
	let g:syntastic_style_error_symbol = 'oo'
	let g:syntastic_warning_symbol = '!!'
	let g:syntastic_style_warning_symbol = '??'
end
" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}

" use two spaces between sentences {{{
set cpoptions+=J
" }}}

" suppress LustyExplorer ruby warning for sysytems without ruby support {{{
let g:LustyExplorerSuppressRubyWarning = 1
" }}}

" line numbering {{{
" set relative line number
set relativenumber
" quickly toggle between absolute and relative line numbers
nnoremap <silent> <S-F4> :execute &nu==&rnu? "se nu!" : "se rnu!"<CR>
" }}}

" Execute current line or current selection as Vim EX commands. {{{
nnoremap <F9> :execute getline(".")<CR>
"vnoremap <F9> :<C-w>execute join(getline("'<","'>"),'<Bar>')<CR>
vnoremap <F9> :<C-w>execute join(getline("'<","'>"),"\n")<CR>
" }}}

" automatically rearrange csv file columns on open and save {{{
augroup CSV_Editing
	autocmd!
	autocmd BufRead,BufWritePost *.csv,*.tsv :%ArrangeColumn
	autocmd BufWritePre *.csv,*.tsv :%UnArrangeColumn
augroup end
" }}}

" define text objects for markdown headers, (not for visual mode) {{{
augroup markdown_headers_text_object
	autocmd!
	autocmd Filetype markdown :onoremap ih :<c-u>execute "normal! ?^\\(=\\<bar>-\\)\\{2,}$\r:nohlsearch\rkvg_"<cr>
	autocmd Filetype markdown :onoremap ah :<c-u>execute "normal! ?^\\(=\\<bar>-\\)\\{2,}$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" set fold method for vimscript files {{{
augroup vimscript_foldmethod
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" change mappings for crunch {{{
map <silent> <leader>cr <plug>CrunchEvalLine
map <silent> <leader>cx <plug>CrunchEvalBlock
" }}}

" activate concealing {{{
set conceallevel=2
" }}}

" make <C-a> and <C-x> work on only decimal numbers {{{
set nrformats=
" }}}

" insert timestamp {{{
nmap <S-F5> a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <S-F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
" }}}

" increase history for ex commands {{{
set history=10000
" }}}

" make help window appear as new tab {{{
augroup HelpInTabs
	autocmd!
	autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
	if &buftype == 'help'
		execute "normal \<C-W>T"
	endif
endfunction
" }}}

" set virtual edit {{{
set virtualedit=block
" }}}

" set maximum width marker, only on longer lines {{{
if has("gui_running")
	highlight ColorColumn guibg=darkred
else
	highlight ColorColumn ctermbg=darkred
end
call matchadd('ColorColumn', '\%81v', 100)
" }}}

" highlight the next match in red when using n/N after search {{{
if has("gui_running")
	highlight WhiteOnRed guibg=red guifg=white
else
	highlight WhiteOnRed ctermbg=red ctermfg=white
end
nnoremap <silent> n n:call HLNext(0.4)<CR>
nnoremap <silent> N N:call HLNext(0.4)<CR>
function! HLNext(blinktime)
	let target_pat = '\c\%#'.@/
	let ring = matchadd('WhiteOnRed', target_pat, 1)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction
" }}}

" listtrans mappings {{{
nmap <leader>cl :call ListTrans_toggle_format()<CR>
vmap <leader>cl :call ListTrans_toggle_format('visual')<CR>
" }}}

" vmath mappings {{{
vnoremap <expr> ++ VMATH_YankAndAnalyse() 
nmap ++ vip++
" }}}

" avoid cursor keys for History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}}

" add quick mapping to current buffer's path in command mode {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}

" settings for signify {{{
" restrict to only git and mercurial
let g:signify_vcs_list = [ 'git', 'hg' ]
let signify_sign_weight = 'none'
let g:signify_sign_color_inherit_from_linenr = 1
" }}}
