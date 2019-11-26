set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Basics configurations 
" set term=screen-256color
set guicursor=
set noshowmode
set cursorline
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamedplus
set autowrite     " Automatically :write before running commands
set shortmess+=a
set shortmess+=s
set shortmess+=c
set shortmess+=F
set fillchars+=vert:│,fold:-

set nowildmenu
set hidden
set updatetime=300

" Mappings
let mapleader = ","
nnoremap <leader>g :G<cr>
nnoremap <silent> <leader>h :noh<cr>
map <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <silent> <leader>ec :CocConfig<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>vs :vnew<cr>
nnoremap <silent> <leader>hs :new<cr>
nnoremap <silent> <leader>in :IndentLinesToggle<cr>
nnoremap <leader>f :Ack! 
nnoremap <silent> <leader>= :CocCommand prettier.formatFile<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>rn <Plug>(coc-rename)
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Make searching better set gdefault
set gdefault
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set showmatch

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set title        " show nice title in xterm
let &showbreak='↳ ' 
" set nowrap
" set wrapmargin=16
" set textwidth=78
" set cc=+1

" Numbers
set nonumber
set numberwidth=3
set relativenumber

" Splits
set splitright
set splitbelow

" Plugins
call plug#begin('~/.config/nvim/plugins')
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'raimondi/delimitmate'
Plug 'tmhedberg/matchit'
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-commentary'
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'stanangeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Plugins Configuration  
" ----------- coc.nvim  ------------- 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:UltiSnipsExpandTrigger = "<C-Space>"

" ----------- Vista  ------------- 
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" ----------- NERDTree ------------- 
let g:NERDTreeMinimalUI=1

" ----------- ctrlp ------------- 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.mp4,*.ogg,*.pdf,*.jpg,*.jpeg,*.gif,*.deb,*.webm,*.mkv

" ----------- base16 ------------------------
if exists('$KONSOLE_PROFILE_NAME') !~ 1
    let base16colorspace=256
endif
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

" ----------- airline ------------------------
" let g:airline_theme='base16'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_paste = 0
let g:airline_detect_crypt = 0
let g:airline_detect_spell = 0
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#cursormode#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number


" ----------- lightline ------------------------
" let g:lightline = {
"             \ 'active': {
"             \   'left': [ [ 'mode', 'paste' ],
"             \             [ 'readonly', 'filename', 'myfileformat', 'modified'] ],
"             \   'right': [ [ 'lineinfo']
"             \              ]
"             \ },
"             \'inactive': {
"             \ 'left': [ [ 'filename' ] ],
"             \ 'right': [ ],
"             \},
"             \'component': {
"             \'lineinfo': ' %3l/%-2v',
"             \},
"             \'component_function': {
"             \'readonly': 'LightlineReadonly',
"             \'filetype': 'MyFiletype',
"             \'myfileformat': 'MyFileformat',
"             \},
" \}
" let g:lightline.colorscheme = 'solarized'

" function! LightlineReadonly()
"   return &readonly ? '' : ''
" endfunction

" function! LightlineFugitive()
"   if exists('*fugitive#head')
"     let branch = fugitive#head()
"     return branch !=# '' ? ''.branch : ''
"   endif
"   return ''
" endfunction

" function! MyFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction

" function! MyFileformat()
"   return WebDevIconsGetFileTypeSymbol()
" endfunction


" ----------- vim-commentary ------------------------
" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

" ----------- vim-php-namespace ------------------------
" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" ---------- vim-closetag -----------------------
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js"
au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" ---------- delimitMate -----------------------
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

" ---------- indentline -----------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '│' " let g:indentLine_char = '┊'
let g:indentLine_bufTyepExlude = ['Nerd_tree.*']
let g:indentLine_fileTypeExclude = ['help', 'markdown', 'reason']
let g:vim_json_syntax_conceal = 1

" ---------- devicons -----------------------
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>
" source ~/Repos/dotfiles/autocmds.vim
" source ~/Repos/dotfiles/functions.vim
execute 'highlight link EndOfBuffer ColorColumn'
execute 'highlight clear VertSplit'
execute 'highlight link VertSplit LineNr'


" ---- Gnvim 
" set guifont=Fira\ Code:h12
" set guifont=Operator\ Mono\ Lig\ bold:h12:w1
" set linespace=6
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175
