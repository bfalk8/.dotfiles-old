" Environment {
	" Basics {
		set nocompatible 		" must be first line
		set background=dark     " Assume a dark background
	" }


	" Plugin Support {
		call plug#begin('~/.vim/plugged')

		" Make sure you use single quotes
		" Always Loaded
		Plug 'kien/ctrlp.vim'
		Plug 'tpope/vim-fugitive'
		Plug 'tpope/vim-surround'
"    	Plug 'OmniSharp/omnisharp-vim'
    	Plug 'tpope/vim-dispatch'
"    	Plug 'scrooloose/syntastic'

		" On-demand loading
		Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

		" Add plugins to &runtimepath
		call plug#end()
	"}

" }

" General {
	set background=dark         " Assume a dark background
  set term=screen-256color
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


" Vim UI {

  colorscheme badwolf    		" load a colorscheme
    
    " set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	" NO BELLS!
	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=

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
	set wrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set expandtab 	  	     		" tabs are spaces, not tabs
	set tabstop=4 					" an indentation every four columns
	set softtabstop=4 				" let backspace delete indent
	"set matchpairs+=<:>            	" match, to be used with %
	" set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	" Remove trailing whitespaces and ^M chars
	" autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

	"The default leader is '\', but many people prefer ',' as it's in a standard
	"location
	let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

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

    "clearing highlighted search
    " nmap <silent> <leader>/ :nohlsearch<CR>

	" Shortcuts
	" Change Working Directory to that of the current file
    " cmap cwd lcd %:p:h
	" cmap cd. lcd %:p:h

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
		colorscheme badwolf			" Colorscheme for gVim
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

" PLUGIN SETTINGS {

  "}

" }
