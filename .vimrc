"---- General Settings ----

syntax on
set showmatch
set number
set ruler
set incsearch
set hlsearch
set ignorecase
set cursorline               " Highlight current line
set backspace=2
set nocompatible
set hidden
set noea
set swb=useopen
set bufhidden=hide
set nosol                    " remember column pos when moving up/down
set so=14

colorscheme wombat256mod     " set font to 256 version if regular vim
if has("gui_running")
    colorscheme wombat
endif

set t_Co=256

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 9
    else
        set guifont=Inconsolata-dz\ for\ Powerline:h11
    endif
endif

set wmh=0
set clipboard=unnamedplus    " Map default register to sys clipboard
set complete=.,w,b,u
filetype plugin on
set nobackup                 " Disable ~backups
"set nowritebackup
"set directory=~/.vim/swp//
"set undofile                " Uncomment for persistent undo history (vim 7.3+)
"set undodir=~/.vim/undo//

"---- gVim Specific ----

set mouse=a
set guioptions-=T            " Hide toolbar
"set guioptions-=r           " Hide right scrollbar
"set guioptions-=m           " Hide menubar
set winaltkeys=no            " Disable menu access w/ALT

syntax sync minlines=1000    " Sync highlighting up to 1000 characters in the file

"---- Indent Settings ----

set noautoindent
set nocindent
set nosmartindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent off          " I INDENT MY OWN CODE

"---- Misc ----

hi ColorColumn ctermbg=235 guibg=#272727
set colorcolumn=80           " PEP8 color column (vim 7.3+)

" highlight unecessary whitespace
highlight ExtraWhiteSpace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$\|\t\+/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t\+/
au InsertLeave * match ExtraWhiteSpace /\s\+$\|\t\+/

"---- Bindings ----

let mapleader = ","          " Set leader to , for convenience
let g:mapleader = ","

" Make y also copy to system keyboard
nnoremap y "+y
vnoremap y "+y

" Make jk traverse wrapped lines
nmap j gj
nmap k gk

" Easier bindings for moving through splits (just ctrl + hjkl)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap ' `
nnoremap ` '

" Clear highlighted search
nmap <leader>cs :let @/=""<CR>

" Go to the next buffer
nmap <leader>b :bn<CR>
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

" Copy paste shortcut
imap <C-v> <ESC>"+gP

"--- Plugin Specific ---

let g:miniBufExplMapCTabSwitchBufs=1     " minibufexpl.vim

set laststatus=2                         " vim-powerline
let g:Powerline_symbols = 'fancy'

" kwbd.vim
nmap <leader>x :Bd<CR>

" scratchtoggle.vim
nmap <leader>s :ScratchToggle<CR>

" ctrlp
map <C-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
