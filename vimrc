set nocompatible
filetype off

" Basics configurations 
set noshowmode
set cursorline
set linespace=10 " work only for gvim, for vim console check terminal options
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
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'  
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets' 
Plug 'scrooloose/nerdtree'  
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'tmhedberg/matchit'
Plug 'alvan/vim-closetag' 
Plug 'vim-scripts/tComment' 
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'stanangeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'ryanoasis/vim-devicons'
call plug#end()

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

" ----------- ultisnips ------------- 
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ----------- lightline ------------------------
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

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0

if(has("gui")) 
    set guifont=Fira\ Code\ 16
endif

