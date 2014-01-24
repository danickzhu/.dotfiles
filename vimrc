" danick's vimrc
" Please contact zhugs_2004@163.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initilize pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim " if pathogen as submodule
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " not compatible with the old-fasion vi mode
set bs=2            " allow backspacing over everyting in insert mode
set history=100     " keep 100 lines of command line history
set nobackup        " no back up file
set noswapfile      " no swap file
set autoread        " auto read when file is changed from outside
set background=dark
set virtualedit=onemore " allow for cursor beyond last character

if has('cmdline_info')
    set showmode        " show current mode
    set ruler           " show the cursor positiorn all the time
    set showcmd         " show partical commands in status line
endif

"filetype off        " necessary to make ftdetect work on Linux
syntax on           " highlight
filetype on         " Enable filetype detection
filetype indent plugin on " Enable filetype-specific indenting
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline      " highlight current line
set number          " show line number
set hlsearch        " serach highlighting
set incsearch       " incremental seach
set showmatch       " cursor shows matching ) and }
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search patten is all lowercase, case-sensitive otherwise
set list            " highlight problemmatic whitespaces
set listchars=tab:,.,trail:.,extends:#,nbsp:.
"set mouse=a        " allow mouse to move
set mousehide
set wrap            " wrap long lines
set wildchar=<TAB>  " start wild expansion in the command line using <TAB>
set wildmenu        " wild char completion menu, show list instead of just completing
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc
" indent
set autoindent      " indent at the same level of the previous line
set copyindent      " copy the previous indention on autoindeting
set tabstop=4       " an indentation every four columns
set shiftwidth=4    " use indents of 4 spaces
set expandtab       " tabs are spaces, not tabs
set smarttab        " insert tabs on the start of a line according to context

set magic           " turn magic on for regular expressions
" set spell         " spell checking on
set scrolljump=5    " lines to scroll when cursor leaves screen
set scrolloff=3     " minium lines to keep above and below cursor
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2    " always show the status line
" format status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','   "set leader kep to be ','
let g:mapleader=","
nmap <silent> <leader>/ :nohlsearch<CR>     " clear highlighting
" easy move in tabs and windows
map <C-J> <C-W>j<C-W>_  "move to and maximize the below split
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
" move around tabs. conflict wiht original screen top/bottom
map <S-H> gT        " go to prev tab
map <S-L> gt        " go to next tab
map <C-t><C-t> :tabnew<CR>  " new tab
map <C-t><C-w> :tabclose<CR>    " close tab

" remove trailing white space and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,pig autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

augroup filetypedetect
    au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundle configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" Tabularize, will not trigger, no Tabularize loaded
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a| :Tabularize /|<CR>
    vmap <Leader>a| :Tabularize /|<CR>
    nmap <Leader>a<Bar> :Tabularize  /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize  /<Bar><CR>
    " The following function automatically aligns when typing a
    function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
    endfunction
endif
" Buffer explorer
nmap <leader>b :BufExplorer<CR>
" ctrlp
let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>      " Mac only <C-P> can invloke
nnoremap <silent> <D-r> :CtrlPMRU<CR>   " Mac only
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
" easymotion is not working
" Neocomplcache
let g:acp_enableAtStartup = 0   " Disable autocomplpoop
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion, define keyword
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <expr><C-g>   neocomplcache#undo_completion()
inoremap <expr><C-l>   neocomplcache#complete_common_string()
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB> completion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
" For snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Ctags
set tags=./tags;/,~/.vimtags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }
    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif
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
            let directory = substitute(directory, " ", "\\\\ ", "g")
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


