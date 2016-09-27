set nocompatible
filetype off                  " required

set rtp+=%USERPROFILE%/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tmhedberg/matchit'
Plugin 'rgarver/Kwbd.vim'
Plugin 'mtth/scratch.vim'
Plugin 'tpope/vim-surround'
Plugin 'jacoborus/tender'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'michalbachowski/vim-wombat256mod'

call vundle#end()            " required
filetype plugin indent on    " required

"---- General Settings ----

syntax on
set encoding=utf8
set noshowmatch
set splitbelow
set number
set ruler
set incsearch
set hlsearch
set ignorecase
set cursorline               " Highlight current line
set backspace=2
set hidden
set noea
set swb=useopen
set bufhidden=hide
set nosol                    " remember column pos when moving up/down
set so=14

set t_Co=256

colorscheme wombat256mod
if has("gui_running")
    colorscheme tender
    set guifont=Inconsolata_for_Powerline:h12:cANSI:qDRAFT
endif

set wmh=0
set clipboard=unnamedplus    " Map default register to sys clipboard
set complete=.,w,b,u
set nobackup
set noswapfile

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

" .cg syntax
au BufRead,BufNewFile *.shader setfiletype cg

"--- Plugin Specific ---

" kwbd
nmap <leader>x :bd<CR>

" scratch
nmap <leader>s :ScratchPreview<CR>
let g:scratch_height = 30

" airline
set laststatus=2
let g:airline_theme = 'tender'

if has("gui_running")
    let g:airline_powerline_fonts = 1
endif

" omnisharp
set completeopt=longest,menuone
let g:OmniSharp_server_path="C:\\Users\\bundy\\.vim\\bundle\\omnisharp-vim\\server\\OmniSharp\\bin\\Debug\\OmniSharp.exe"
let g:OmniSharp_selector_ui = "ctrlp"

augroup omnisharp_commands
    autocmd!

    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
augroup END

" ctrlp
map <C-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0
