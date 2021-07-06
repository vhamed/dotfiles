"    _           _   _                 _             
"   (_)         (_) | |               (_)            
"    _   _ __    _  | |_      __   __  _   _ __ ___  
"   | | | '_ \  | | | __|     \ \ / / | | | '_ ` _ \ 
"   | | | | | | | | | |_   _   \ V /  | | | | | | | |
"   |_| |_| |_| |_|  \__| (_)   \_/   |_| |_| |_| |_|
"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.config/nvim/settings.vim 
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/autocmds.vim
lua require("first_config")

" Choose colorscheme
color gruvbox8_hard


" tmp commands
" execute 'highlight link EndOfBuffer ColorColumn'
" execute 'highlight clear VertSplit'
" execute 'highlight link VertSplit LineNr'
" execute 'highlight clear NonText'

" Enable Italics
" set t_ZH=^[[3m
" set t_ZR=^[[23m
" set t_8b=^[[48;2;%lu;%lu;%lum
" set t_8f=^[[38;2;%lu;%lu;%lum
