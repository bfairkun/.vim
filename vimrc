" cheatsheet
" gt and gT switch tabs back and forth

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'

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

" REMAPS

let mapleader = ","

:imap kj <Esc>

map <leader><space> :let @/=''<cr> " clear search

" remap to revert to text state at most recent write
map <leader>u :earlier 1f

" " remap Ctrl + arrows to move text arround (via Tpope's unimpaired plugin)
" nmap <C-Up> [e
" imap <C-Up> <C-O><C-Up>
" vmap <C-Up> [egv
" nmap <C-Down> ]e
" imap <C-Down> <C-O><C-Down>
" vmap <C-Down> ]egv

" " remap Shift + arrows to move around windows
" nnoremap <S-Up>      <C-W>K
" nnoremap <S-Down>    <C-W>J
" nnoremap <S-Left>    <C-W>H
" nnoremap <S-Right>   <C-W>L

" " remap <C-[hjkl]> to navigate windows
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k

" remap whitespace toggle
noremap <leader>w :set list!<CR>

" list loaded buffers
nnoremap gb :ls<CR>:b<Space>

" toggle NerdTree file explorer
map <C-o> :NERDTreeToggle<CR>

" cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" remap the auto-pairs toggle
let g:AutoPairsShortcutToggle = '<leader>a'

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.smk set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" add snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

let g:NERDTreeNodeDelimiter = "\u00a0"

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set colorcolumn=120     " add colored line at 80 char
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line


:set wildmenu
:set listchars=eol:‚èé,tab:¬ª-,trail:¬∑,nbsp:‚éµ
:set list

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
nnoremap <leader>r :call NumberToggle()<cr>

" always scroll to show some lines below cursor
set scrolloff=5

" macros
" macro to insert generic snakemake rule on line below
let @r = 'okjirule MyRule:	input:	"MyInput"Äkboutput:	"MyOutput"Äkblog:	""Äkbparams:	""Äkbshell:	""""""ÄkbÄkbkj13k'

