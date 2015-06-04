set nocompatible
filetype off

" pre plugin configuration

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'myusuf3/numbers.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'cespare/vim-toml'
Plugin 'wting/rust.vim'
Plugin 'burnettk/vim-angular'
Plugin 'digitaltoad/vim-jade'
Plugin 'wookiehangover/jshint.vim'
Plugin 'mxw/vim-jsx'
" snake_case (crs)
" MixedCase (crm)
" camelCase (crc),
" snake_case (crs),
" UPPER_CASE (cru)
Plugin 'tpope/vim-abolish'
call vundle#end()            " required
filetype plugin indent on    " required

set hidden
set background=dark
"set nowrap
set tabstop=4
set expandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set history=1000
set undolevels=1000
set undofile
set undodir=$HOME/.vimundo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

" Use , for leader
let mapleader = ","

filetype plugin indent on
autocmd filetype python set expandtab

if &t_Co >= 256 || has("gui_running")
    colorscheme delek
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

if &diff
    colorscheme evening
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.
nnoremap <Leader>m :set list!<CR>:set list?<CR>

set pastetoggle=<F2>

set mouse=a

nnoremap j gj
nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

cmap w!! w !sudo tee % >/dev/null

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

let g:EasyMotion_do_mapping = 0 "disable defaults
let g:EasyMotion_smartcase = 1 "capitals=sensitive

" easymotion mappings
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>y <Plug>(easymotion-y)
map <Leader>d <Plug>(easymotion-d)

map <Leader>p :set paste!<CR>:set paste?<CR>


" Remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd
    \ BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set formatoptions+=t
set textwidth=79
set colorcolumn=+1
hi ColorColumn ctermbg=236 guibg=darkgrey
