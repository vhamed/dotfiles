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
set updatetime=300

" Mappings
let mapleader = ","
nnoremap <silent> <leader>h :noh<cr>
map <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>ec :CocConfig<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>vs :vnew<cr>
nnoremap <leader>hs :new<cr>
nnoremap <leader>in :IndentLinesToggle<cr>
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
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
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
" Plug 'sheerun/vim-polyglot'
Plug 'stanangeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Plugins Configuration  
" ----------- coc.nvim  ------------- 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:UltiSnipsExpandTrigger = "<C-Space>"

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
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#formatter = 'unique_tail'


" ----------- lightline ------------------------
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'myfileformat', 'modified'] ],
            \   'right': [ [ 'lineinfo']
            \              ]
            \ },
            \'inactive': {
            \ 'left': [ [ 'filename' ] ],
            \ 'right': [ ],
            \},
            \'component': {
            \'lineinfo': ' %3l/%-2v',
            \},
            \'component_function': {
            \'readonly': 'LightlineReadonly',
            \'filetype': 'MyFiletype',
            \'myfileformat': 'MyFileformat',
            \},
            \'separator': { 'left': '', 'right': '' },
            \'subseparator': { 'left': '', 'right': '' }
            \}
let g:lightline.colorscheme = 'solarized'

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
if exists('veonim')

" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>
set linespace=14
endif
