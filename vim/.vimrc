"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ bfalk8 <bfalk@ucsd.edu>
" ░▓ code   ▓ http://github.com/bfalk8/.dotfiles
" ░▓ mirror ▓ http://git.io/.files
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"
" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" }

" Environment {
	" Basics {
		set nocompatible 		" must be first line
		set background=dark     " Assume a dark background
	" }

	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier.
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
	" }

" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻   ┏━┓╺┳╸╻ ╻┏━╸┏━╸
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫   ┗━┓ ┃ ┃ ┃┣╸ ┣╸
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹   ┗━┛ ╹ ┗━┛╹  ╹

	" Setup Vundle Support {
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	if has('win32') || has('win64')
        set rtp+=$HOME/.vim/bundle/Vundle.vim/
        call vundle#begin('$HOME/.vim/bundle/')
        set shell=powershell
        set shellcmdflag=-command
    else
        set rtp+=~/.vim/bundle/Vundle.vim
	    call vundle#begin()
    endif
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	" Plugins here

	" NERDTree
	" Plugin 'scrooloose/nerdTree'

	" ctrlp
	Plugin 'kien/ctrlp.vim'

	" Surround
	" Plugin 'tpope/vim-surround'

	" Fugitive
	" Plugin 'tpope/vim-fugitive'

	" TypeScript
	" Plugin 'leafgarland/typescript-vim'

	" Emmet
	" Plugin 'mattn/emmet-vim'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
	" }

" }

" General {
	set background=dark         " Assume a dark background
    if !has('win32') && !has('win64')
        set term=$TERM       " Make arrow and other keys work
    endif
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	" set mouse=a					" automatically enable mouse usage
	"set autochdir 				" always switch to the current file directory.. Messes with some plugins, best left commented out
	" not every vim is compiled with this, use the following line instead
	" If you use command-t plugin, it conflicts with this, comment it out.
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8

	" set autowrite                  " automatically write a file when leaving a modified buffer
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	" set virtualedit=onemore 	   	" allow for cursor beyond last character
	" set history=1000  				" Store a ton of history (default is 20)
	" set spell 		 	        	" spell checking on

	" Setting up the directories {
		set backup 						" backups are nice ...
		set undofile					" so is persistent undo ...
		" set undolevels=1000 "maximum number of changes that can be undone
		" set undoreload=10000 "maximum number lines to save for undo on a buffer reload
        " Moved to function at bottom of the file
		"set backupdir=$HOME/.vimbackup//  " but not when they clog .
		"set directory=$HOME/.vimswap// 	" Same for swap files
		"set viewdir=$HOME/.vimviews// 	" same for view files

		"" Creating directories if they don't exist
		"silent execute '!mkdir -p $HVOME/.vimbackup'
		"silent execute '!mkdir -p $HOME/.vimswap'
		"silent execute '!mkdir -p $HOME/.vimviews'
		" au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		" au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" ╻┏┓╻╺┳╸┏━╸┏━┓┏━╸┏━┓┏━╸┏━╸
" ┃┃┗┫ ┃ ┣╸ ┣┳┛┣╸ ┣━┫┃  ┣╸
" ╹╹ ╹ ╹ ┗━╸╹┗╸╹  ╹ ╹┗━╸┗━╸

" Vim UI {

    if !has('win32') && !has('win64')
	    colorscheme badwolf    		" load a colorscheme
    endif
    " set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode
	" set t_Co=256					" forces 256 color
	" set cursorline  				" highlight current line
	" hi cursorline guibg=#333333 	" highlight bg color of current line
	" hi CursorColumn guibg=#333333   " highlight cursor

	" if has('cmdline_info')
		" set ruler                  	" show the ruler
		" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		" set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	" endif

    " ┏━┓╺┳╸┏━┓╺┳╸╻ ╻┏━┓╻  ╻┏┓╻┏━╸
    " ┗━┓ ┃ ┣━┫ ┃ ┃ ┃┗━┓┃  ┃┃┗┫┣╸
    " ┗━┛ ╹ ╹ ╹ ╹ ┗━┛┗━┛┗━╸╹╹ ╹┗━╸

	" if has('statusline')
        " set laststatus=2

		" Broken down into easily includeable segments
		" set statusline=%<%f\    " Filename
		" set statusline+=%w%h%m%r " Options
		" set statusline+=%{fugitive#statusline()} "  Git Hotness
		" set statusline+=\ [%{&ff}/%Y]            " filetype
		" set statusline+=\ [%{getcwd()}]          " current dir
		"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
		" set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	" endif

	set backspace=indent,eol,start	" backspace for dummys
	set linespace=0					" No extra spaces between rows
	set nu							" Line numbers on
	set showmatch					" show matching brackets/parenthesis
	set incsearch					" find as you type search
	set hlsearch					" highlight search terms
	" set winminheight=0				" windows can be 0 line high
	set ignorecase					" case insensitive search
	set smartcase					" case sensitive when uc present
	set wildmenu					" show list instead of just completing
	set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
	" set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	" set scrolljump=5 				" lines to scroll when cursor leaves screen
	" set scrolloff=3 				" minimum lines to keep above and below cursor
	" set foldenable  				" auto fold code
	" set gdefault					" the /g flag on :s substitutions by default
    " set list
    " set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace


" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=2               	" use indents of 4 spaces
	set expandtab 	  	     		" tabs are spaces, not tabs
	set tabstop=2 					" an indentation every four columns
	set softtabstop=2 				" let backspace delete indent
	"set matchpairs+=<:>            	" match, to be used with %
	" set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	" Remove trailing whitespaces and ^M chars
	" autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }


" ┏━╸┏━┓┏┳┓┏┳┓┏━┓┏┓╻╺┳┓┏━┓
" ┃  ┃ ┃┃┃┃┃┃┃┣━┫┃┗┫ ┃┃┗━┓
" ┗━╸┗━┛╹ ╹╹ ╹╹ ╹╹ ╹╺┻┛┗━┛

" Key (re)Mappings {

	"The default leader is '\', but many people prefer ',' as it's in a standard
	"location
	let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :


	" Easier moving in tabs and windows
	" map <C-J> <C-W>j<C-W>_
	" map <C-K> <C-W>k<C-W>_
	" map <C-L> <C-W>l<C-W>_
	" map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    " nnoremap j gj
    " nnoremap k gk

	" The following two lines conflict with moving to top and bottom of the
	" screen
	" If you prefer that functionality, comment them out.
	" map <S-H> gT
	" map <S-L> gt

	" Stupid shift key fixes
	" cmap W w
	" cmap WQ wq
	" cmap wQ wq
	" cmap Q q
	" cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	" nnoremap Y y$

	""" Code folding options
	" nmap <leader>f0 :set foldlevel=0<CR>
	" nmap <leader>f1 :set foldlevel=1<CR>
	" nmap <leader>f2 :set foldlevel=2<CR>
	" nmap <leader>f3 :set foldlevel=3<CR>
	" nmap <leader>f4 :set foldlevel=4<CR>
	" nmap <leader>f5 :set foldlevel=5<CR>
	" nmap <leader>f6 :set foldlevel=6<CR>
	" nmap <leader>f7 :set foldlevel=7<CR>
	" nmap <leader>f8 :set foldlevel=8<CR>
	" nmap <leader>f9 :set foldlevel=9<CR>

    "clearing highlighted search
    " nmap <silent> <leader>/ :nohlsearch<CR>

	" Shortcuts
	" Change Working Directory to that of the current file
    " cmap cwd lcd %:p:h
	" cmap cd. lcd %:p:h

	" visual shifting (does not exit Visual mode)
	" vnoremap < <gv
	" vnoremap > >gv

	" Fix home and end keybindings for screen, particularly on mac
	" - for some reason this fixes the arrow keys too. huh.
	" map [F $
	" imap [F $
	" map [H g0
	" imap [H g0

	" For when you forget to sudo.. Really Write the file.
	" cmap w!! w !sudo tee % >/dev/null
" }


" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		" set guioptions-=T          	" remove the toolbar
		set lines=40               	" 40 lines of text instead of 24,
		set columns=120
		set guioptions-=m  "remove menu bar
		set guioptions-=T  "remove toolbar
		set guioptions-=r  "remove right-hand scroll bar
		set guioptions-=L  "remove left-hand scroll bar
		set guifont=Consolas:h13	" Uncomment on high-DPI screens
		colorscheme badwolf		" Colorscheme for gVim
		" FULLSCREEN
		"run the command immediately when starting vim
		" autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)

		" activate/deactivate full screen with function key <F11>
		map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 1)<CR>
	" else
		" set term=builtin_ansi       " Make arrow and other keys work
	endif 	" End of GUI stuff
" }



" FILE INIT

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
			  \ 'backup': 'backupdir',
			  \ 'views': 'viewdir',
			  \ 'swap': 'directory',
			  \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
	  let directory = parent . '/' . prefix . dirname . "/"
	  if exists("*mkdir")
		  if !isdirectory(directory)
			  call mkdir(directory)
		  endif
	  endif
	  if !isdirectory(directory)
		  echo "Warning: Unable to create backup directory: " . directory
		  echo "Try: mkdir -p " . directory
	  else
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
	  endif
  endfor
endfunction
call InitializeDirectories()

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction

" Use local vimrc if available {
    " if filereadable(expand("~/.vimrc.local"))
        " source ~/.vimrc.local
    " endif
" }

:set fileformats=unix,dos
:set fileformat=unix
