set nocompatible
filetype off

" Basics configurations 
set noshowmode
set linespace=1
set showcmd       " display incomplete command
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
set term=screen-256color





" My personal configurations
" inoremap <esc> <nop>
let mapleader ="," 
" let maplocalleader="<space>"
map <Leader><leader> <Plug>(easymotion-prefix)
nnoremap <silent> <leader>h :noh<cr> " Stop highlight after searching
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>





" code to solve (back at original) problem
set noshowmode

" set shortmess+=c
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
set textwidth=115

" Numbers
set nonumber
set numberwidth=5
set relativenumber


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim/ " set the runtime path to include Vundle and initialize"
" call vundle#rc() 
call vundle#begin() 

" List of my Plugins 
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

" quotes, parentesis..
Plugin 'surround.vim' " This plugin is a tool for dealing with pairs of surroundings.
Plugin 'raimondi/delimitmate' " provides automatic closing of quotes, parenthesis, brackets, etc.

" comment
Plugin 'tComment' " TComment will comment out/uncommented.
Plugin 'scrooloose/nerdcommenter'

" better search
Plugin 'easymotion/vim-easymotion' " EasyMotion provides a much simpler way to use some motions in vim.

" tabulation
Plugin 'godlygeek/tabular'
Plugin 'yggdroot/indentline'
Plugin '2072/PHP-Indenting-for-VIm'

" Java
Plugin 'artur-shaik/vim-javacomplete2' " an omni-completion plugin for Java.

" Cpp
Plugin 'rip-rip/clang_complete' " This plugin use clang for accurately completing C and C++ code.
Plugin 'octol/vim-cpp-enhanced-highlight'

" Plugin 'scrooloose/syntastic' " Syntax checking plugin for VIM.
Plugin 'christoomey/vim-tmux-navigator'

" rename current file
Plugin 'danro/rename.vim'

" Php
Plugin 'stanangeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'

call vundle#end()  
" Restore settings for file detection
filetype plugin indent on

" Plugins Configuration  
" ----------- ultisnips ------------- 
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips/"
let g:UltiSnipsExpandTrigger="<c-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsEditSplit="vertical"  " If you want :UltiSnipsEdit to split your window.

" ----------- youcompleteme ------------- 

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

" " ----------- Syntastic ----------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 2

" ----------- base16 ------------------------
let base16colorspace=256
" colorscheme base16-default-dark
" the profile_helper will update a ~/.vimrc_background file that will have your current the colorscheme, you just need to source this file in your vimrc.
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

" ----------- lightline ------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ]
      \              ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!',
	  \   'lineinfo': '%3l / %-2v',
      \ },
      \ }

let g:surround_63 = "<?php \r ?>"
" autocmd FileType php let b:surround_63 = "<?php \r ?>"

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <C-;> <Esc>:call IPhpInsertUse()<CR>

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-s>     <Esc>bgUeea<CR>
