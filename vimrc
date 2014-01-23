" danick's vimrc
" Please contact zhugs_2004@163.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initilize pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim " if pathogen as submodule
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" not compatible with the old-fasion vi mode
set bs=2 	 		" allow backspacing over everyting in insert mode
set history=100  	" keep 100 lines of command line history
set nobackup		" no back up file
set noswapfile		" no swap file
set autoread	 	" auto read when file is changed from outside
set background=dark
set virtualedit=onemore	" allow for cursor beyond last character

if has('cmdline_info')
	set showmode		" show current mode
	set ruler			" show the cursor positiorn all the time
	set showcmd			" show partical commands in status line
endif

filetype off		" necessary to make ftdetect work on Linux
syntax on			" highlight
filetype on			" Enable filetype detection
filetype indent plugin on " Enable filetype-specific indenting
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
set noerrorbells
set novisualbell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline   	" highlight current line
set number		 	" show line number
set hlsearch		" serach highlighting
set incsearch		" incremental seach
set showmatch 		" cursor shows matching ) and }
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search patten is all lowercase, case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
set list			" highlight problemmatic whitespaces
set listchars=tab:,.,trail:.,extends:#,nbsp:.
"set mouse=a	 	" allow mouse to move
set mousehide
set wrap			" wrap long lines
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu 		" wild char completion menu, show list instead of just completing
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
" indent
set autoindent		" indent at the same level of the previous line
set tabstop=4		" an indentation every four columns
set shiftwidth=4	" use indents of 4 spaces
set expandtab		" tabs are spaces, not tabs
set copyindent		" copy the previous indention on autoindeting

set magic 			" turn magic on for regular expressions
" set spell			" spell checking on
set scrolljump=5	" lines to scroll when cursor leaves screen
set scrolloff=3		" minium lines to keep above and below cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8	" default encoding
set fileformats=unix,dos,mac

if filereadable('/usr/share/terminfo/x/xterm-256color')
    set term=xterm-256color
elseif filereadable('/usr/share/terminfo/p/putty-256color')
    set term=putty-256color
else
    set term=xterm-color
endif
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized


