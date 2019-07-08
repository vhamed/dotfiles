set nocompatible
filetype off

" Basics configurations 
set noshowmode
set cursorline
" set linespace=3 " work only for gvim, for vim console check terminal options
set wildmenu    " command-line completion operates in an enhanced mode.
set completeopt-=preview
set showcmd       " display incomplete command
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
" set ruler         " show the cursor position all the time
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" set term=screen-256color
set shortmess+=a
set shortmess+=s
set shortmess+=c
set shortmess+=F




" My Custom configurations
let mapleader = ","
nnoremap <silent> <leader>h :noh<cr>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>vs :vnew<cr>
nnoremap <leader>hs :new<cr>
nnoremap <leader>in :IndentLinesToggle<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader>f :Ack! 
" set list                             " show trailing whitespace etc
" set listchars=tab:»\ ,trail:·,nbsp:·
" set listchars=nbsp:·
 
" code to solve (back at original) problem
" try
"   set shortmess+=c
" catch /^Vim\%((\a\+)\)\=:E539: Illegal character/
"   autocmd MyAutoCmd VimEnter *
"         \ highlight ModeMsg guifg=bg guibg=bg |
"         \ highlight Question guifg=bg guibg=bg
" endtry


" Make searching better set gdefault Never have to type /g at the end of search / replace again
set gdefault
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
set incsearch
set showmatch


" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set smartindent
set title        " show nice title in xterm
let &showbreak='↳ ' 
" set nowrap
" set wrapmargin=16
" set textwidth=78
" set cc=+1
set fillchars+=vert:│
" set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)

" Numbers
set nonumber
set numberwidth=2
set relativenumber

" Splits
set splitright
set splitbelow

" Plugins
set rtp+=~/.config/vim/plugins/Vundle.vim/ " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/
call vundle#begin('~/.config/vim/plugins') 
" Plugin manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'  
Plugin 'chriskempson/base16-vim'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets' 

Plugin 'scrooloose/nerdtree.git'  
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'surround.vim'
Plugin 'raimondi/delimitmate'
Plugin 'tmhedberg/matchit'
Plugin 'alvan/vim-closetag' 

Plugin 'tComment' 

Plugin 'yggdroot/indentline'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'danro/rename.vim'

Plugin 'wincent/terminus'

" Highlight 
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'stanangeloff/php.vim'
Plugin 'jwalton512/vim-blade'

Plugin 'ryanoasis/vim-devicons'
call vundle#end()

" Restore settings for file detection
filetype plugin indent on

" Plugins Configuration  
" ----------- NERDTree ------------- 
let g:NERDTreeMinimalUI=1

" ----------- ctrlp ------------- 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.mp4,*.ogg,*.pdf,*.jpg,*.jpeg,*.gif,*.deb,*.webm,*.mkv

" ----------- YCM ------------- 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0

" ----------- ultisnips ------------- 
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----------- base16 ------------------------
if exists('$KONSOLE_PROFILE_NAME') !~ 1
    let base16colorspace=256
endif
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

" ----------- lightline ------------------------
let g:lightline = {
            \'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'relativepath', 'fileformat', 'modified'] ],
            \   'right': [ [ 'lineinfo']
            \              ]
            \ },
            \'component': {
            \'lineinfo': '%3p%% :   %3l/%-2v',
            \},
            \'component_function': {
            \'readonly': 'LightlineReadonly',
            \'filetype': 'MyFiletype',
            \'fileformat': 'MyFileformat'
            \},
            \'separator': { 'left': '', 'right': '' },
            \'subseparator': { 'left': '', 'right': '' }
            \}

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return WebDevIconsGetFileTypeSymbol()
endfunction

" ---------- vim-closetag -----------------------
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml"
au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" ---------- delimitMate -----------------------
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

" ---------- indentline -----------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_bufTyepExlude = ['Nerd_tree.*']
let g:indentLine_fileTypeExclude = ['help', 'markdown', 'reason']

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>

execute 'highlight link EndOfBuffer ColorColumn'
execute 'highlight clear VertSplit'
execute 'highlight link VertSplit LineNr'
