" cheatsheet

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
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
Plugin 'jpalardy/vim-slime.git'
Plugin 'tibabit/vim-templates'

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

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" slime plugin preferences
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_no_mappings = 1

" REMAPS


let mapleader = ","

:imap kj <Esc>

" slime remaps
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend
nmap <leader>sl <Plug>SlimeLineSend
nmap <leader>sc :SlimeConfig<cr>
nmap <leader>sr :SlimeSend<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" slime send full file and return cursor to position
nmap <leader>sa mzggvG<leader>s`z
" slime send kill ctl-c
nmap <leader>sk :SlimeSend0 "\x15"<CR>

" clear search
map <leader><space> :let @/=''<cr>

" remap to revert to text state at most recent write
nnoremap <leader>u :earlier 1f

" remap up/down arrows to move page (but not cursor)
noremap <Up> <C-y>
noremap <Down> <C-e>

" remap <C-[hjkl]> to navigate windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" remap whitespace toggle
noremap <leader>w :set list!<CR>

" list loaded buffers
nnoremap gb :ls<CR>:b<Space>

" toggle NerdTree file explorer
map <C-o> :NERDTreeToggle<CR>

" cycle through buffers
nnoremap <leader><Up> :bnext<CR>
nnoremap <leader><Down> :bprevious<CR>
nnoremap <leader><Left>  :buffer #<CR>

" use xclip to interact with local clipboard while vim is run on remote ssh session
vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip

"  remap the auto-pairs toggle
let g:AutoPairsShortcutToggle = '<leader>a'

nnoremap <leader>m :call ToggleMouse()<cr>
nnoremap <leader>n :call NumberToggle()<cr>

" remap SnipMate triggers to not clash with SuperTab
" snipMateTrigger expands snippets even within another snippet
:imap <leader><tab> <Plug>snipMateNextOrTrigger
:smap <leader><tab> <Plug>snipMateNextOrTrigger
:imap <leader><S-tab> <Plug>snipMateBack
:smap <leader><S-tab> <Plug>snipMateBack
:imap <leader><leader><tab> <Plug>snipMateTrigger

" remap easy motion prefix
map <space> <Plug>(easymotion-prefix)

" repeat previous command in tmux pane 1
nnoremap <leader>r :!tmux send-keys -t 1 C-p C-j <CR><CR>
" repeat previous command in tmux pane 2
nnoremap <leader>2r :!tmux send-keys -t 2 C-p C-j <CR><CR>
" cancel command in tmux pane 1
nnoremap <leader>c :!tmux send-keys -t 1 C-c <CR><CR>

set mouse=a
" Zoom in to window, and zoom out to equalize windows
nnoremap Zz <c-w>_ \| <c-w>\|
nnoremap Zo <c-w>=

" delete to black hole register
nnoremap <leader>d "_d

" toggle paste insert mode
nnoremap <leader>p :set paste!<cr>

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.smk set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" add snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

autocmd FileType snakemake setlocal commentstring=#\ %s

let g:NERDTreeNodeDelimiter = "\u00a0"

set runtimepath+=~/.vim/my-snippets/

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set colorcolumn=120     " add colored line at 80 char
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line


set wildmenu
set wildmode=longest,list
set listchars=eol:⏎,tab:»-,trail:·,nbsp:⎵
set list
set mouse=a

" highlight search
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

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

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" always scroll to show some lines below cursor
set scrolloff=5


