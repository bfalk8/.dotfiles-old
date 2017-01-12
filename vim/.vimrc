set nocompatible     " must be first line
set background=dark     " Assume a dark background


" PLUGIN SUPPORT {
    call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'chriskempson/base16-vim'
    "Plug 'Shougo/unite.vim'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-commentary'
    Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
    " Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer --omnisharp-completer'}
    Plug 'scrooloose/syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'powerline/powerline' "DEPRECATED
    Plug 'godlygeek/tabular'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
    Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
    Plug 'eagletmt/neco-ghc', {'for': 'haskell'}

    " Add plugins to runtimepath
    call plug#end()
"}

" GENERAL {
    set background=dark         " Assume a dark background
    set term=screen-256color
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    " set mouse=a               " automatically enable mouse usage
    "set autochdir              " always switch to the current file directory.. Messes with some plugins, best left commented out
    " not every vim is compiled with this, use the following line instead
    " If you use command-t plugin, it conflicts with this, comment it out.
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    scriptencoding utf-8

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT       " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    " set virtualedit=onemore        " allow for cursor beyond last character
    " set history=1000          " Store a ton of history (default is 20)
    " set spell                  " spell checking on

    " Setting up the directories {
        set backup             " backups are nice ...
        set undofile          " so is persistent undo ...
        " set undolevels=1000 "maximum number of changes that can be undone
        " set undoreload=10000 "maximum number lines to save for undo on a buffer reload
            " Moved to function at bottom of the file
        "set backupdir=$HOME/.vimbackup//  " but not when they clog .
        "set directory=$HOME/.vimswap//   " Same for swap files
        "set viewdir=$HOME/.vimviews//   " same for view files

        "" Creating directories if they don't exist
        "silent execute '!mkdir -p $HVOME/.vimbackup'
        "silent execute '!mkdir -p $HOME/.vimswap'
        "silent execute '!mkdir -p $HOME/.vimviews'
        " au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
        " au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }


" VIM UI {

    " colorscheme badwolf       " load a colorscheme
    colorscheme onedark         " load a colorscheme
    " colorscheme base16-chalk  " load a colorscheme

    " set tabpagemax=15         " only show 15 tabs
    set showmode                " display the current mode

    " NO BELLS!
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=

    set backspace=indent,eol,start  " backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set rnu                         " Relative Line numbers on
    autocmd WinEnter,FocusGained * :setlocal number relativenumber
    autocmd WinLeave,FocusLost * :setlocal number norelativenumber
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    " set winminheight=0            " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set splitbelow                  " new splits go below current one
    set splitright                  " new vsplits go to the right
    " set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
    " set scrolljump=5              " lines to scroll when cursor leaves screen
    " set scrolloff=3               " minimum lines to keep above and below cursor
    " set foldenable                " auto fold code
    " set gdefault                  " the /g flag on :s substitutions by default
    set list
    set listchars=tab:>.,trail:.,extends:>,precedes:<,nbsp:. " Highlight problematic whitespace

" }

" FORMATTING {
    " set wrap                      " wrap long lines
      set autoindent                " indent at the same level of the previous line
      set shiftwidth=4              " use indents of 4 spaces
      set expandtab                 " tabs are spaces, not tabs
      set tabstop=4                 " an indentation every four columns
      set softtabstop=4             " let backspace delete indent
      " set matchpairs+=<:>          " match, to be used with %
      " set pastetoggle=<F12>       " pastetoggle (sane indentation on pastes)
      " set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
      " Remove trailing whitespaces and ^M chars
      " autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" KEY MAPPINGS {

    " The default leader is '\', but <Space> is more convenient
    let mapleader = "\<Space>"

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    " enables repeat f,F,t,T
    nnoremap <Leader>; ;
    nnoremap ; :
    " nnoremap : ;
    " enables repeat f,F,t,T
    vnoremap <Leader>; ;
    vnoremap ; :
    " vnoremap : ;

    " Switching between splits
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Clearing the highlight from search
    nnoremap <silent> <Leader>/ :noh<CR>

    " Moving Blocks of Text
    " nnoremap <Leader>j :m .+1<CR>==
    " nnoremap <Leader>k :m .-2<CR>==

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    " nnoremap Y y$

    " Clearing highlighted search
    " nmap <silent> <Leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    " cmap cwd lcd %:p:h
    " cmap cd. lcd %:p:h

" }

" FILE SETTINGS {
    :set fileformats=unix,dos
    :set fileformat=unix

    " Python shiftwidth, tabstop, softtabstop {
        autocmd FileType python set sw=4
        autocmd FileType python set ts=4
        autocmd FileType python set sts=4
    " }
    " Haskell {
        autocmd FileType haskell set tabstop=8
        autocmd FileType haskell set expandtab
        autocmd FileType haskell set softtabstop=4
        autocmd FileType haskell set shiftwidth=4
        autocmd FileType haskell set shiftround
        autocmd FileType haskell nnoremap <Leader>c :GhcModCheckAsync<CR>
        autocmd FileType haskell nnoremap <Leader>/ :noh<CR>:GhcModTypeClear<CR>
        autocmd FileType haskell nnoremap <Leader>ti :GhcModTypeInsert<CR>
        autocmd FileType haskell nnoremap <Leader>tc :GhcModType<CR>
        " Disable haskell-vim omnifunc
        let g:haskellmode_completion_ghc = 1
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    " }
"}

" PLUGIN SETTINGS {
    " tmux navigator {
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
        "nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
    " }
    " CtrlP {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'ra'
    " }
    " NERDTree {
        map <Leader>n :NERDTreeToggle<CR>
    " }
    " Unite {
       "call unite#filters#matcher_default#use(['matcher_fuzzy'])
       "nnoremap <C-p> :Unite file_rec/async<cr>
    " }
    " YouCompleteMe {
        " Configure YouCompleteMe
        let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
        let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
        let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
        let g:ycm_complete_in_comments = 1 " Completion in comments
        let g:ycm_complete_in_strings = 1 " Completion in string
        let g:ycm_autoclose_preview_window_after_insertion = 1

        let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

        " Goto definition with F3
        map <F3> :YcmCompleter GoTo<CR>
        " let g:ycm_semantic_triggers = {'haskell' : ['.']}
    " }
    " UltiSnips {
        let g:UltiSnipsExpandTrigger="<c-l>"
        let g:UltiSnipsJumpForwardTrigger="<c-l>"
        let g:UltiSnipsJumpBackwardTrigger="<c-m>"
    " }
    " vim-airline {
        " let g:airline_theme='base16_chalk'
        let g:airline_theme='base16_pop'
        set laststatus=2

        " Use the powerline fonts...make sure they are installed
        let g:airline_powerline_fonts = 1
        " let g:airline_symbols.space = "\ua0"

        " ALLOWS IT TO LOOK GOOD WITHOUT THE POWERLINE FONTS, REMOVES '>' and
        let g:airline_left_sep=''
        let g:airline_right_sep=''

        " Custom Tabline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#tabline#show_tabs = 1
        let g:airline#extensions#tabline#show_tab_nr = 1
        let g:airline#extensions#tabline#show_tab_type = 0
        let g:airline#extensions#tabline#show_close_button = 0

        " Truncation
          " let g:airline#extensions#default#section_truncate_width = {
          "     \ 'b': 79,
          "     \ 'x': 60,
          "     \ 'y': 88,
          "     \ 'z': 45,
          "     \ 'warning': 80,
          "     \ 'error': 80,
          "     \ }
    " }
    " Syntastic {
        map <Leader>s :SyntasticToggleMode<CR>
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 0
    " }
    " Tabular {
        nnoremap <Leader>a/ :Tabularize /
        vnoremap <Leader>a/ :Tabularize /
        nnoremap <Leader>a= :Tabularize /=<CR>
        vnoremap <Leader>a= :Tabularize /=<CR>
        nnoremap <Leader>a: :Tabularize /:<CR>
        vnoremap <Leader>a: :Tabularize /:<CR>
        nnoremap <Leader>a- :Tabularize /-<CR>
        vnoremap <Leader>a- :Tabularize /-<CR>
    " }

" }

" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        " set guioptions-=T            " remove the toolbar
        set lines=40                 " 40 lines of text instead of 24,
        set columns=120
        set guioptions-=m  "remove menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
        set guioptions-=L  "remove left-hand scroll bar
        set guifont=Consolas:h13  " Uncomment on high-DPI screens
        colorscheme badwolf      " Colorscheme for gVim
    endif   " End of GUI stuff
" }

" FILE INIT {

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

    " function! NERDTreeInitAsNeeded()
    "     redir => bufoutput
    "     buffers!
    "     redir END
    "     let idx = stridx(bufoutput, "NERD_tree")
    "     if idx > -1
    "         NERDTreeMirror
    "         NERDTreeFind
    "         wincmd l
    "     endif
    " endfunction
" }

" Use local vimrc if available {
    " if filereadable(expand("~/.vimrc.local"))
        " source ~/.vimrc.local
    " endif
" }

