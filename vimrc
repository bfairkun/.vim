set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:imap kj <Esc>

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

:set wildmenu
:set listchars=eol:‚èé,tab:¬ª-,trail:¬∑,nbsp:‚éµ
:set list


let mapleader = ","
map <leader><space> :let @/=''<cr> " clear search

map <leader>t :tabn<CR> 
map <leader>T :tabp<CR> 

" remap to revert to text state at most recent write
map <leader>u :earlier 1f

" remap arrows to faster move arrounds
noremap <Up> 10k
noremap <Down> 10j

" remap whitespace toggle 
noremap <leader>w :set list!<CR>

" toggle NerdTree file explorer
map <C-o> :NERDTreeToggle<CR>

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.smk set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set colorcolumn=120     " add colored line at 80 char
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

set number                     " Show current line number
" function and to toggle relative and absolute number
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <leader> :call NumberToggle()<cr>

" always scroll to show some lines below cursor
set scrolloff=5

" macros
" macro to insert generic snakemake rule on line below
let @r = 'okjirule MyRule:	input:	"MyInput"Äkboutput:	"MyOutput"Äkblog:	""Äkbparams:	""Äkbshell:	""""""ÄkbÄkbkj'
