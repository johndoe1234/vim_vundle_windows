set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$VIM/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'vundle'
Bundle 'molokai'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'cscope.vim'
Bundle 'FSwitch'
Bundle 'LustyJuggler'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'surround.vim'
Bundle 'OmniCppComplete'
Bundle 'ProtoDef'
Bundle 'unimpaired.vim'


let mapleader = ","
nnoremap <silent> <leader>ev :e $VIM/vimrc<CR>
nnoremap <silent> <leader>sv :so $VIM/vimrc<CR>



au GUIEnter * simalt ~x "x on an English Windows version. n on a French one

if &t_Co >= 256 || has("gui_running")
   "colorscheme molokai
   colorscheme desert
endif

if has("syntax")
  syntax on
endif

" Source the vimrc file after saving it
"regenerate ctags for project that file has been saved
if has("autocmd")
  autocmd! bufwritepost vimrc source $VIM/vimrc
  autocmd! bufwritepost .vimrc source $VIM/vimrc
  autocmd BufRead *.xml :% !xmllint.exe % --format
endif

"move undofiles to some master trash dir
set undodir=~/.vimundo

filetype plugin indent on

let s:ruby_path = 'C:\Ruby192\bin'
set wildignore+=*.xml,*.obj,*.log,*.rsp

"remap leader from \ to ,
let mapleader = ","


set nocompatible
set autowrite		" Automatically save before commands like :next and :make

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nobackup
set noswapfile

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden             " Hide buffers when they are abandoned
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set showmatch		" Show matching brackets.
set gdefault        " automatic adding g in regexp substisute :%s/something/else/g
set showcmd		" Show (partial) command in status line.
set hlsearch 
"clearing search results
nnoremap <leader>/ :noh<cr>


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85


set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

"killing arrow keiys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


"no need for F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"no need to use shift
nnoremap ; :

"when changing focus always write changes to a file
au FocusLost * :wa


"exiting insert mode with jj
inoremap jj <ESC>l
inoremap kk <ESC>l

nnoremap <leader>fo :call FormatCpp()<CR><CR>
nnoremap <leader>zf :FufCoverageFile<CR>
nnoremap <leader>zl :FufLine<CR>
nnoremap <leader>zb :FufBuffer<CR>
nnoremap <leader>zt :FufTag<CR>

"create new vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

"copying to windows copy/paste buffer
nnoremap <leader>yw "*yaw
nnoremap <leader>yy "*yyy

"moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>ev :e $VIM/vimrc<CR>
nnoremap <silent> <leader>sv :so $VIM/vimrc<CR>


nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

"number of lines visible before scrolling
set scrolloff=8
set sidescrolloff=8

set history=500


"fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR> "getting status

"FSwitch definitions and mappings
augroup mycppfiles
    au!
    "creating .cpp files if it does not exist,
    "and looking for .cc and .c fle if .cpp does not exist
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
augroup END

"Switch to the file and load it into the current window 
nmap <silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right 
nmap <silent> <Leader>ol :FSRight<cr>
"Switch to the file and load it into a new window split on the right 
nmap <silent> <Leader>oL :FSSplitRight<cr>
"Switch to the file and load it into the window on the left 
nmap <silent> <Leader>oh :FSLeft<cr>
"Switch to the file and load it into a new window split on the left 
nmap <silent> <Leader>oH :FSSplitLeft<cr>

"setings for tagbar
let g:tagbar_left=1
nnoremap <silent> <F9> :TagbarToggle<CR>



" configure tags - add additional tags here or comment out not-used ones
set tags+=c:\tags\cpp
set tags+=OAMtags
" build tags of your own project with Ctrl-F12
map <C-F12> :silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F11> :silent !cscope -b -R<CR>
map <C-F10> :silent !ctags -R -L ctags_includes --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f OAMtags<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"let g:clang_complete_auto = 1
"let g:clang_use_library = 1



"windows specific ?
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set foldmethod=syntax
set guifont=Lucida_Console:h9
imap <C-SPACE> <C-R>=UltiSnips_ExpandSnippet()<CR>
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=T
let g:LustyJugglerSuppressRubyWarning = 1


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1


autocmd FileType ruby,eruby imap <S-CR> <CR><CR>end<Esc>-cc
autocmd FileType cpp imap <S-CR> <CR><CR>}<Esc>-cc

function! FormatCpp()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    "removing white space on the end of the lines
    silent! %s/\([(){};]\)\s\+$/\1/
    silent! %s/\(\S\)\s\+$/\1/

    "removing whitespace  smth     , -> smth,
    "(  smth -> (smth
    "smth   ) -> smt)
    silent! %s/\s\+\([),]\)/\1/
    silent! %s/\([(]\)\s\+/\1/

    "removing whitespace  ,smth -> , smth
    silent! %s/,\(\w\)/, \1/

    "convert something==something -> something == something
    silent! %s/\(\S\)\([=!>+<]\{1\}=\)/\1 \2/
    silent! %s/\([=!>+<]\{1\}=\)\(\S\)/\1 \2/
    silent! %s/\(\S\)\(<<\)/\1 \2/
    silent! %s/\(<<\)\(\S\)/\1 \2/

    "removing whitspace from ==
    silent! %s/\s\{2,}\([=!>+<]=\)/ \1/
    silent! %s/\([=!>+<]=\)\s\{2,}/\1 /

    "converting  smth     = -> smth =
    silent! %s/\s\{2,\}\([=,<>/]\)/ \1/
    silent! %s/\([=,<>/]\)\s\{2,\}/\1 /

    "formatting
    silent! normal ggVG=

    silent! :w
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

