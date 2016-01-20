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
Plugin 'scrooloose/syntastic'
Plugin 'mxw/vim-jsx'
Plugin 'evidens/vim-twig'
Plugin 'wavded/vim-stylus'
" snake_case (crs),
" MixedCase (crm),
" camelCase (crc),
" UPPER_CASE (cru)
Plugin 'tpope/vim-abolish'
" Rust autocomplete
Plugin 'phildawes/racer'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Glench/Vim-Jinja2-Syntax'
call vundle#end()            " required
filetype plugin indent on    " required

let g:jsx_ext_required = 0

" Racer setup
let g:racer_cmd = "/home/rdodd/packages/racer/target/release/racer"
let $RUST_SRC_PATH = "/home/rdodd/packages/rust/src"

set hidden
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
" Needed before s is mapped
nnoremap <Leader>s :SyntasticToggleMode<CR>

filetype plugin indent on
autocmd filetype python set expandtab

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

if &diff
    "colorscheme evening
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.
nnoremap <Leader>m :set list!<CR>:set list?<CR>

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
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
nnoremap <Leader>w <Plug>(easymotion-w)
nnoremap <Leader>y <Plug>(easymotion-y)
map <Leader>d <Plug>(easymotion-d)

map <Leader>p :set paste!<CR>:set paste?<CR>
map <Leader>n :set number!<CR>:set number?<CR>


" Remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,stylus autocmd
    \ BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set formatoptions+=t
set textwidth=79
set colorcolumn=+1

" Load lilypond
filetype off
set runtimepath+=/usr/share/lilypond/2.18.2/vim/
filetype on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
" TODO find better way of doing this

set background=dark
if &t_Co >= 256 || has("gui_running")
    let g:solarized_termcolors=256
    "colorscheme solarized
endif
nnoremap <Leader>l :ls<CR>:b
hi ColorColumn ctermbg=236 guibg=darkgrey

