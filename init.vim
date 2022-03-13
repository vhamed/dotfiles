"    _           _   _                 _             
"   (_)         (_) | |               (_)            
"    _   _ __    _  | |_      __   __  _   _ __ ___  
"   | | | '_ \  | | | __|     \ \ / / | | | '_ ` _ \ 
"   | | | | | | | | | |_   _   \ V /  | | | | | | | |
"   |_| |_| |_| |_|  \__| (_)   \_/   |_| |_| |_| |_|
"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let &showbreak='↳ ' 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let &showbreak='↳ ' 

" Numbers
set number
set numberwidth=3
set relativenumber
set signcolumn=number

" Splits
set splitright
set splitbelow

" Colorscheme
set termguicolors
set background=dark 

" Tabline
set showtabline=2

" Search
set gdefault
set ignorecase    
set smartcase
set showmatch

" Cursor line
set cursorline

" Clipboard
set clipboard=unnamedplus

set noshowmode

" backup 
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands

" shortmess
set shortmess+=a
set shortmess+=s
set shortmess+=c
set shortmess+=F

set fillchars+=vert:│,fold:-

set hidden
set updatetime=300

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=2
set shiftround
set expandtab
set smartindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-t>     :tabnew<CR>
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>vs :vnew<cr>
nnoremap <silent> <leader>hs :new<cr>
nnoremap <silent> <leader>0 :tabmove 0<cr>
nnoremap <silent> <leader>h :noh<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>/ y/<C-r>"<cr>
tnoremap <leader>q <C-\><C-n>

" Git 
nnoremap <leader>g :G<cr>
nnoremap <leader>gg :G<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gb :BlamerToggle<cr>

" Nvim-tree
" nnoremap <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>n :NvimTreeToggle<CR>

" Telescope
nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files({previewer = false, layout_config={width=80}, hidden = true})<cr>
" nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>gp <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>d <cmd>lua search_dotfiles()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').colorscheme()<cr>

" Indentation 
" nnoremap <silent> <leader>in :IndentLinesToggle<cr>

" Vim-align 
xmap ga <Plug>(EasyAlign)    " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)    " Start interactive EasyAlign for a motion/text object (e.g. gaip)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require("user.plugins")


" Choose colorscheme
color gruvbox8_hard
