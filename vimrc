" VUNDLE PLUGIN MANAGER

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
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'jpalardy/vim-slime.git'
Plugin 'tibabit/vim-templates'
Plugin 'bkad/camelcasemotion'
Plugin 'roxma/vim-paste-easy'
Plugin 'tpope/vim-rhubarb'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'

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

" SET PLUGIN PREFERENCES AND VARIABLES

" slime plugin preferences
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_no_mappings = 1

" To make YouCompleteMe play nice with Ultisnips, use Ctl-N Ctl-P for
" YouCompleteMe autocompletion, and use Tab to expand and move through
" snippets
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" close YCM preview after leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" do not close YCM preview after accepting completion
let g:ycm_autoclose_preview_window_after_completion = 0

" map the auto-pairs toggle
let g:AutoPairsShortcutToggle = '<leader>a'

" move through camel case words with leader
let g:camelcasemotion_key = '<leader>'

let g:NERDTreeNodeDelimiter = "\u00a0"


" REMAPS

let mapleader = ","

:imap kj <Esc>

" Change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" fugitive remaps
" git status
nnoremap <leader>gs :G<CR>
" git commit
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>

" vimdiff remaps to resolve merge conflicts
" get left window (HEAD copy) into working copy
nmap <leader>g<left> :diffget //2
" get right window (merge copy) into working copy
nmap <leader>g<right> :diffget //3

" slime remaps
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend
nmap <leader>sl <Plug>SlimeLineSend
nmap <leader>sc :SlimeConfig<cr>
nmap <leader>sr :SlimeSend<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" slime send full file and return cursor to position
nmap <leader>sa mzggvG<leader>s`z
" slime send kill ctl-c
nmap <leader>sk :SlimeSend0 "<c-c>"<CR>

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

" remap view invisible whitespace toggle
noremap <leader>i :set list!<CR>

" list loaded buffers
nnoremap gb :ls<CR>:b<Space>

" toggle NerdTree file explorer
map <C-o> :NERDTreeToggle<CR>

" cycle through buffers
nnoremap <leader><Up> :bnext<CR>
nnoremap <leader><Down> :bprevious<CR>
nnoremap <leader><Left>  :buffer #<CR>

" use pbcopy to interact with local clipboard while vim is run on remote ssh session
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" custom functions that toggle something
nnoremap <leader>m :call ToggleMouse()<cr>
nnoremap <leader>n :call NumberToggle()<cr>
nnoremap <leader>Y :call ToggleYCM()<cr>
" remap easy motion prefix
map <space> <Plug>(easymotion-prefix)

" repeat previous command in tmux pane 1
nnoremap <leader>r :!tmux send-keys -t 1 C-p C-j <CR><CR>
" repeat previous command in tmux pane 2
nnoremap <leader>2r :!tmux send-keys -t 2 C-p C-j <CR><CR>
" cancel command in tmux pane 1
nnoremap <leader>c :!tmux send-keys -t 1 C-c <CR><CR>

" Zoom in to window, and zoom out to equalize windows
nnoremap Zz <c-w>_ \| <c-w>\|
nnoremap Zo <c-w>=

" delete to black hole register
nnoremap <leader>d "_d
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

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.smk set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" add snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

autocmd FileType snakemake setlocal commentstring=#\ %s


set runtimepath+=~/.vim/my-snippets/

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

set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line
set number              " Show current line number
"
" always scroll to show some lines below cursor
set scrolloff=5

" FUNCTIONS
"
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

function! ToggleYCM()
    if(g:ycm_auto_trigger == 1)
        let g:ycm_auto_trigger=0
    else
        let g:ycm_auto_trigger=1
    endif
endfunc
