"---- General Settings ----

syntax on
set showmatch
set number
set ruler
set incsearch
set hlsearch
set ignorecase
set cursorline        " Highlight current line
set backspace=2
set nocompatible
set hidden
set noea
set swb=useopen
set bufhidden=hide
colorscheme wombat
set t_Co=256
set guifont=Inconsolata-dz\ for\ Powerline:h11
set wmh=0
set clipboard=unnamed " Map default register to sys clipboard
set complete=.,w,b,u
filetype plugin on
set nobackup          " Disable ~backups
"set nowritebackup
"set directory=~/.vim/swp//
"set undofile         " Uncomment for persistent undo history (vim 7.3+)
"set undodir=~/.vim/undo//
set statusline=\ \ %F\ %m%=buffer\ %n\ \|\ line\ %l\ col\ %c\ [%P]\ 

"---- gVim Specific ----

set guioptions-=T     " Hide toolbar
"set guioptions-=r    " Hide right scrollbar
"set guioptions-=m    " Hide menubar
set winaltkeys=no     " Disable menu access w/ALT

syntax sync minlines=1000 " Sync highlighting up to 1000 characters in the file

"---- Indent Settings ----

set noautoindent
set nocindent
set nosmartindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent off   " I INDENT MY OWN CODE

"---- Misc ----
hi ColorColumn ctermbg=235 guibg=#272727
set colorcolumn=80    " PEP8 color column (vim 7.3+)

" highlight unecessary whitespace
highlight ExtraWhiteSpace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"---- Bindings ----

let mapleader = ","
let g:mapleader = ","

" Make jk traverse wrapped lines
nmap j gj
nmap k gk

" Easier bindings for moving through splits (just ctrl + hjkl)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bindings for resizing splits
"map <A-j> <C-W>-
"map <A-k> <C-W>+
"map <A-l> 5<C-W>>
"map <A-h> 5<C-W><
"map <A-m> 1000<C-W><
"map <C-m> 80<C-W>>

nnoremap ' `
nnoremap ` '

nmap <leader>cs :let @/=""<CR>           " Clear highlighted search
nmap <leader>b :bn<CR>                   " Go to the next buffer

"--- Plugin Specific ---

nmap <leader>x :Bd<CR>                   " kwbd.vim
let g:miniBufExplMapCTabSwitchBufs=1     " minibufexpl.vim
nmap <leader>n :NumbersToggle<CR>        " numbers.vim

set laststatus=2                         " vim-powerline
let g:Powerline_symbols = 'fancy'