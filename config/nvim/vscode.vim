set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader = ","
nnoremap <silent> <leader>h :noh<cr>
nnoremap <silent> <leader>vs :vnew<cr>
nnoremap <silent> <leader>hs :new<cr>

" Allow copy and paste from clipboard
set clipboard=unnamedplus

" Make searching better set gdefault
set gdefault
set ignorecase
set smartcase
set showmatch

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=2
set shiftround
set expandtab
set smartindent

" Numbers
set nonumber
set numberwidth=3
set relativenumber

" Splits
set splitright
set splitbelow

" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
call plug#end()

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
