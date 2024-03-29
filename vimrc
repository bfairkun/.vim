" Ben's vimrc
" Type 'zR' to open all code folds
" ':help zo' for more about opening/closing folds
" PLUGINS {{{

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Keep Plugin commands between plug#begin/end.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-zoom'
" Plug 'nanotech/jellybeans.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'jpalardy/vim-slime', {'branch': 'main' }
Plug 'mileszs/ack.vim', {'on': 'Ack'}
Plug 'tibabit/vim-templates'
Plug 'bkad/camelcasemotion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-rhubarb', {'on': 'GBrowse'}
Plug 'JamshedVesuna/vim-markdown-preview', { 'for':'markdown' }
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'simeji/winresizer', {'on': 'WinResizerStartResize'}
Plug 'https://github.com/snakemake/snakemake.git', {'rtp': 'misc/vim/', 'for':'snakemake'}
" Plug 'snakemake/snakefmt', {'for':'snakemake'}
" The above plugin didn't work for me. I made an autocommand to do the job
" Plug 'chrisbra/csv.vim'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'dense-analysis/ale', {'for': ['r', 'rmd', 'python', 'snakemake']}
Plug 'jalvesaq/Nvim-R', {'for': ['r', 'rmd']}
if v:version == 801 && has('python3')
    Plug 'bfairkun/YouCompleteMe', {'commit':'d98f896',  'do': './install.py' }
endif
if v:version >= 802 && has('python3')
    " If this post PluginInstall hook script doesn't work, make sure it isn't
    " using conda python. For example, if `which python` returns
    " `/Users/benfair/anaconda3/bin/python` then you may want to try
    " `/usr/local/bin/python3 install.py`
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
endif
Plug 'SirVer/ultisnips'

" Initialize plugin system
call plug#end()

" }}}
" PLUGIN PREFERENCES AND GLOBAL VARIABLES {{{

" slime plugin preferences
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_no_mappings = 1
let g:slime_preserve_curpos = 0

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

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

" move through camel case words with leader
let g:camelcasemotion_key = '<leader>'

" Github style markdown previews. Uses python grip to render markdown
let vim_markdown_preview_github=1

" ale settings linters and fixers
let g:ale_lint_on_enter = 0
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': ['trim_whitespace'], 'python': ['black']}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0

" vim was crashing on my mac unless I added this
let g:UltiSnipsUsePythonVersion = 2

" Search for custom templates here
let g:tmpl_search_paths = ['~/.vim/templates']
" If you make a template named ~/.vim/templates/My.Example.template
" Then you start a new file using the template with :e My.Example

let g:NERDTreeNodeDelimiter = "\u00a0"

" Disable csv plugin maps
let g:no_csv_maps = 1

" Use R 3.4.3 on midway
let R_path = '/software/R-3.4.3-el7-x86_64/bin/'
" Always open console in horizontal split below
let R_rconsole_width = 0
let R_rconsole_height = 15
" Open Rmd rendered to html automatically
let R_openhtml = 1
" Rmd chunk header syntax highlighting
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1
let R_clear_line = 1
let R_objbr_place = 'console,right'
" Open object browser and move to window up after starting R
let R_after_start = [':execute "normal ;ro"', ':wincmd k']
" don't remap anything to '<-' assign operator
let R_assign = 0

" custom ctags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

let g:tagbar_type_snakemake = {
    \ 'ctagstype' : 'snakemake',
    \ 'kinds'     : [
        \ 'r:rules',
    \ ]
\ }


" }}}
" SET LEADER KEY {{{
let mapleader = ","
let maplocalleader = ";"
" }}}
" NORMAL+VISUAL MODE REMAPS {{{
" A custom function to show all remaps defined in vimrc
nnoremap <leader>M :ShowVimrcMaps<CR>

imap kj <Esc>

" Change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" search and replace
nnoremap <leader>/ :%s///gc<Left><Left><Left><Left>
vnoremap <leader>/ :s///gc<Left><Left><Left><Left>

" Add text object for between forward slashes. 'ci/' for 'change inside /'
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" clear search
nnoremap <leader><space> :let @/=''<cr>

" Edit in place with shell command
" Mnemonic is 'E' for execute command
" Useful with awk, grep, sort, commands
nnoremap <leader>E :%!<space>

" Change color scheme
nnoremap <leader>C :colorscheme<space>

" Useful for working with tab separated files...
" Expand tabs to spaces to visually align
nnoremap <leader>S :%!<space>column<space>-t<CR>
" Collapse spaces to tabs
nnoremap <leader>T :%s/ \+/\t/g<CR>

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

" remap up/down arrows to move page (but not cursor)
noremap <Up> <C-y>
noremap <Down> <C-e>

" remap <C-[hjkl]> to navigate windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" list loaded buffers
nnoremap gb :ls<CR>:b<Space>

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Back to previous buffer
nnoremap <leader><Left>  :buffer #<CR>

" Zoom in to window, and zoom out to equalize windows
nnoremap Zz <c-w>_ \| <c-w>\|
nnoremap Zo <c-w>=

" quit
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" close buffer
nnoremap <leader>x :bd<CR>
nnoremap <leader>X :bd!<CR>

" delete to black hole register
nnoremap <leader>d "_d
vmap P "_dP

" repeat previous command in tmux pane 1
nnoremap <leader>r :!tmux send-keys -t 1 C-p C-j <CR><CR>
" repeat previous command in tmux pane 2
nnoremap <leader>2r :!tmux send-keys -t 2 C-p C-j <CR><CR>

" use pbcopy to interact with local clipboard while vim is run on remote ssh session
if executable('pbcopy_to_local')
    vmap <C-x> :!pbcopy_to_local<CR>
    vmap <C-c> :w !pbcopy_to_local<CR><CR>
    vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy_to_local", @") \| let @"=@a<CR> <bar> "*y
endif

" custom functions that toggle something
nnoremap <leader>m :call ToggleMouse()<cr>
nnoremap <leader>n :call NumberToggle()<cr>
nnoremap <leader>Y :call ToggleYCM()<cr>
nnoremap <leader>F :call ToggleFixOnSave()<cr>


"hit qq to record, q to stop recording, and Q to apply macro
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Terminal mode remaps only for vim 8+ or neovim
if has('nvim') ||  v:version >= 801
    " Go to normal mode from terminal mode
    tnoremap <Esc> <C-\><C-n>
    " Switch windows from terminal mode
    tnoremap <C-h> <c-\><c-n><c-w>h
    tnoremap <C-j> <c-\><c-n><c-w>j
    tnoremap <C-k> <c-\><c-n><c-w>k
    tnoremap <C-l> <c-\><c-n><c-w>l
    " <C-w><C-w> is the other way to move around windows, but stay in terminal
    " mode
endif

" }}}
" PLUGIN COMMAND REMAPS{{{

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Other mappings from fzf.vim plugin
" which bring up a popup window to search something
nnoremap gB :Buffers<CR>
nnoremap gF :Files<CR>
nnoremap gS :Snippets<CR>
nnoremap gH :Helptags<CR>

" fugitive remaps
" git status
nnoremap <leader>gs :G<CR>
" git commit
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>

" vimdiff remaps to resolve merge conflicts
nnoremap <leader>g<right> :diffg RE  " get from REMOTE
nnoremap <leader>g<up> :diffg BA  " get from BASE
nnoremap <leader>g<left> :diffg LO  " get from LOCAL

" slime remaps
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend
nmap <leader>sl <Plug>SlimeLineSend
nnoremap <leader>sc :SlimeConfig<cr>
" slime send a certain line range
nnoremap <leader>sr :SlimeSend<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" slime send full file and return cursor to position
nmap <leader>sa mzggvG<leader>s`z
" slime send kill ctl-c
nnoremap <leader>sk :SlimeSend0 "<c-c>"<CR>
" Toggle slime ipython mode. If running an ipython interpreter, this will help
" indented blocks get pasted properly
nnoremap <leader>sp :call ToggleIpythonModeSlime()<cr>

" nvim-R remaps
" Send code to R console
vnoremap <localleader><Space> <Plug>REDSendSelection
nnoremap <localleader><Space> <Plug>RSendMotion
" Send paragraph, like my slime remap
nnoremap <localleader>s<CR> <Plug>REDSendParagraph
" Send selection or paragraph, like Rstudio. Only for R filetype
au FileType r,rmd vnoremap <buffer> <C-CR> <Plug>REDSendSelection
au FileType r,rmd nnoremap <buffer> <C-CR> <Plug>REDSendParagraph

" kill command in R console
nnoremap <localleader>rk <Plug>:Rstop<CR>

" Toggle undo tree
nnoremap <leader>u :UndotreeToggle<CR>

" YouCompleteMe get help doc
nnoremap <leader>hh :YcmCompleter GetDoc<CR>

" ALE Toggle
" Mnemonic: l for linting toggle
nnoremap <leader>l :ALEToggle<CR>
" Mnemonic: f for fix
nnoremap <leader>f :ALEFix<CR>

" Ack search
nnoremap <leader>A :Ack

" remap easy motion prefix
map <space> <Plug>(easymotion-prefix)

"bidirectional easymotion search for letter. Ex: To search for 'r', do '\r'
nmap \ <Plug>(easymotion-s)

" toggle NerdTree file explorer
map <C-o> :NERDTreeToggle<CR>

nnoremap <leader>t :TagbarToggle<CR>

" toggle window zoom
nmap <leader>z <Plug>(zoom-toggle)

" }}}
" INSERT MODE REMAPS {{{
" ... useful for completing a snippet field before moving to
" next field while staying in insert mode

" Replace line with Range from insert mode.
inoremap RR <C-O>dd<up><C-O>:t.<left><left>

" Open new line in insert mode
inoremap OO <C-O>o

" Go beginning of line in insert mode, like some terminals.
inoremap <C-A> <C-O>0

" Jump right word in insert mode, like some terminals
inoremap f <C-O>w

" Jump left word in insert mode, like some terminals. This might not work in
" some terminals
inoremap b <C-O>b

" Go to end of line in insert mode, like some terminals. This might not work
" in some terminals
inoremap <C-E> <C-O>$
" }}}
" VIM OPTION SETTINGS {{{
set t_Co=256 "256 Terminal colors for vim airline

set omnifunc=syntaxcomplete#Complete
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set colorcolumn=120     " add colored line at 80 char
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set commentstring=#\ %s
set wildmenu
set wildmode=longest,list
set listchars=eol:⏎,tab:»-,trail:·,nbsp:⎵
set list
set mouse=a
set ttymouse=xterm2
set modelines=3
" colorscheme default
colorscheme gruvbox
set background=dark

" highlight search
set hlsearch
" hi Search ctermbg=LightYellow
" hi Search ctermfg=Red
highlight Normal ctermbg=255

" make backspaces more powerfull
set backspace=indent,eol,start
set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line
set number              " Show current line number
"
" always scroll to show some lines below cursor
set scrolloff=5

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Set up persistent undo to save more undo history
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" }}}
" AUTOCOMMANDS {{{
au BufRead,BufNewFile *.py setlocal expandtab
au BufRead,BufNewFile *.smk setlocal expandtab

" autocmd vimenter * ++nested colorscheme gruvbox

" Comment strings for snakemake filetype
autocmd FileType snakemake setlocal commentstring=#\ %s

" snakemake is also python filetype (useful for autocompletion plugin)
au BufRead,BufNewFile Snakefile,*.smk set filetype=snakemake.python

set foldlevelstart=20
"start with syntax folds open for * filetypes
autocmd Syntax * setlocal foldmethod=syntax
autocmd Syntax * normal zR

let g:csv_default_delim='\t' 
let g:csv_delim_test = ',;|\\t'

autocmd FileType text setlocal noexpandtab
au BufNewFile,BufRead *.tsv
            \ setlocal filetype=csv |
            \ setlocal noexpandtab
            " :Delimiter \t

" automatically go to insert mode when entering a terminal mode window
autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal A | endif

" Nvim-R IDE like windows if NewTab or VimEnter on R files. Relies on ; for
" localleader
" autocmd TabNew,VimEnter * if count(['r','rmd'],&filetype) | :execute "normal \<Plug>RStart" | endif
autocmd TabNew * if count(['r','rmd'],&filetype) | :execute "normal \<Plug>RStart" | endif
" Atuomatically Quit R when VimLeave
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif

" Hackish way of getting snakefmt (not supported by ALE) to run if snakefile.
"  Note that snakefiles are also python, so subject to black fixer
if executable('snakefmt')
    au FileType snakemake autocmd BufWritePre <buffer> call RunSnakefmt()
endif
" }}}
" CUSTOM FUNCTIONS {{{
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" function to run buffer thru snakefmt
function! RunSnakefmt()
    if executable('snakefmt') && (g:ale_fix_on_save == 1)
        execute ':!snakefmt %'
    endif
endfunction

" function and to toggle relative and absolute number
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

function! s:ShowVimrcMaps()
  let old_reg = getreg("a")          " save the current content of register a
  let old_reg_type = getregtype("a") " save the type of the register as well
try
  redir @a                           " redirect output to register a
  " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
  silent verbose map | call feedkeys("\<CR>")
  redir END                          " end output redirection
  vnew                               " new buffer in vertical window
  put a                              " put content of register
  " Sort on 4th character column which is the key(s)
  %!grep -B1 'vimrc' | grep -v 'vimrc' | grep -v '\-\-' | sort -k1.4,1.4

finally                              " Execute even if exception is raised
  call setreg("a", old_reg, old_reg_type) " restore register a
endtry
endfunction
com! ShowVimrcMaps call s:ShowVimrcMaps()      " Enable :ShowVimrcMaps to call the function


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

function! ToggleFixOnSave()
    if(g:ale_fix_on_save == 1)
        let g:ale_fix_on_save = 0
        echo "Will not fix on save"
    else
        let g:ale_fix_on_save = 1
        echo "Will fix on save"
    endif
endfunc

function! ToggleYCM()
    if(g:ycm_auto_trigger == 1)
        let g:ycm_auto_trigger=0
    else
        let g:ycm_auto_trigger=1
    endif
endfunc


function! ToggleIpythonModeSlime()
    if(!exists("g:slime_python_ipython"))
        let g:slime_python_ipython=1
        echo "Ipython slime mode"
    else
        if(g:slime_python_ipython == 0)
            let g:slime_python_ipython=1
            echo "Ipython slime mode"
        else
            let g:slime_python_ipython=0
            echo "Normal slime mode"
        endif
    endif
endfunc
" }}}
" OTHER {{{
" Add to register



" Override things using a local file ~/.vimrc_local if exists
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" This modeline should be within last 3 lines of file
" vim:foldmethod=marker:foldlevel=0
" }}}
