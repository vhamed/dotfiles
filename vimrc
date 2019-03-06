set nocompatible
filetype off

" Basics configurations 
set noshowmode
set cursorline
" set linespace=3 " work only for gvim, for vim console check terminal options
set wildmenu    " command-line completion operates in an enhanced mode.
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
set term=screen-256color
set shortmess+=a
set shortmess+=s
set shortmess+=c
set shortmess+=F




" My Custom configurations
let mapleader = ","
nnoremap <silent> <leader>h :noh<cr>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>vs :vnew<cr>
nnoremap <leader>hs :new<cr>
nnoremap <leader>in :IndentLinesToggle<cr>
set list                             " show trailing whitespace etc
" set listchars=tab:»\ ,trail:·,nbsp:·
set listchars=nbsp:·
 
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
set textwidth=78
set cc=+1
execute 'highlight link EndOfBuffer ColorColumn'

" Numbers
set nonumber
set numberwidth=5
set relativenumber

" Splits
set splitright
set splitbelow

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim/ " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/
call vundle#begin() 
" Plugin manager
Plugin 'VundleVim/Vundle.vim' " Vim plugin manager, allows you keep track and configure your plugins right in .vimrc.

" Status line
Plugin 'itchyny/lightline.vim'  " A light and configurable statusline/tabline plugin for Vim.

" Vim/Bash Themes
Plugin 'chriskempson/base16-vim'

" autocompletion engine for vim
Plugin 'Valloric/YouCompleteMe' " YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.

" snippets
Plugin 'SirVer/ultisnips' " UltiSnips is the ultimate solution for snippets in Vim.
Plugin 'honza/vim-snippets' " snippets files for various programming languages.

" file explorer
Plugin 'scrooloose/nerdtree.git'  "NERD tree allows you to explore your filesystem and to open files and directories.
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" quotes, parentesis, tags ...
Plugin 'surround.vim' " This plugin is a tool for dealing with pairs of surroundings.
Plugin 'raimondi/delimitmate' " provides automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'tmhedberg/matchit'
Plugin 'alvan/vim-closetag'  " close tage if you press >

" comment
Plugin 'tComment' " TComment will comment out/uncommented.

" tabulation
Plugin 'godlygeek/tabular'

" zoom in/out the current window
Plugin 'troydm/zoomwintab.vim'

" indention
Plugin 'yggdroot/indentline' " show indention level

" tmux-vim switch between
Plugin 'christoomey/vim-tmux-navigator'

" Rename current file
Plugin 'danro/rename.vim'

" Terminus enhances Vim's integration with the terminal
Plugin 'wincent/terminus'

" Java
Plugin 'artur-shaik/vim-javacomplete2' " an omni-completion plugin for Java.

" Cpp
Plugin 'rip-rip/clang_complete' " This plugin use clang for accurately completing C and C++ code.
Plugin 'octol/vim-cpp-enhanced-highlight'

" Php
Plugin 'stanangeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'lvht/phpcd.vim'
Plugin 'arnaud-lb/vim-php-namespace'

" Laravel
Plugin 'jwalton512/vim-blade'

" Html5
Plugin 'othree/html5.vim'

" Css3
Plugin 'hail2u/vim-css3-syntax'

" Javascript
Plugin 'pangloss/vim-javascript'

call vundle#end()

" Restore settings for file detection
filetype plugin indent on

" Plugins Configuration  
" ----------- ultisnips ------------- 
let g:UltiSnipsSnippetDirectories=['UltiSnips']

" I am tried to map <c-space> to expandsnippet manually instead of setting the
" global variable.
" inoremap <F5> <space><Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
" inoremap <C-Space> <space><Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
"
let g:UltiSnipsExpandTrigger="<C-F>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="tabdo"  " If you want :UltiSnipsEdit to split your window.

" ----------- ctrlp ------------- 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.mp3,*.mp4,*.ogg,*.pdf,*.jpg,*.jpeg,*.gif,*.deb,*.webm,*.mkv

" let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

" this two functions allow you to delete file when ctrlp popup by pressing Ctrl-@.
" Added by kien(Ctrlp plugin's creator)
" func! MyCtrlPMappings()
"     nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
" endfunc
"
" func! s:DeleteBuffer()
"     let line = getline('.')
      " let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
"         \ : fnamemodify(line[2:], ':p')
    " exec 'bd' bufid
"     exec 'norm \<F5>'
" endfunc

" ----------- youcompleteme ------------- 
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_key_list_select_completion = ['<TAB>', '<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-P>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'

" ----------- java-complete2 ------------- 
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" " ----------- clang complete ----------------------
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ----------- base16 ------------------------
if exists('$KONSOLE_PROFILE_NAME') !~ 1
    let base16colorspace=256
endif
" colorscheme base16-default-dark
" the profile_helper will update a ~/.vimrc_background file that will have your current the colorscheme, you just need to source this file in your vimrc.
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

" ----------- lightline ------------------------
let g:lightline = {
   \'colorscheme': 'solarized',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'readonly', 'relativepath', 'modified'] ],
   \   'right': [ [ 'lineinfo' ]
   \              ]
   \ },
   \'component': {
   \'lineinfo': '⭡ %3l / %-2v',
   \},
   \'component_function': {
   \'readonly': 'LightlineReadonly'
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
" ----------- surround ------------------------
let g:surround_63 = "<?php \r ?>"
" autocmd FileType php let b:surround_63 = \"<?php \r ?>"

" ----------- php-vim ------------------------
let g:php_var_selector_is_identifier = 1

" ----------- phpcd-complete ------------------------
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

" ----------- vim-php-namespace ------------------------
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" ---------- vim-closetag -----------------------
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml"
au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" ---------- delimitMate -----------------------
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

" ---------- indentline -----------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" ---------- zoomwintab -----------------------
let g:zoomwintab_hidetabbar = 0

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>
source $HOME/.vim/autocmds.vim
source $HOME/.vim/wincent/autocmds.vim
