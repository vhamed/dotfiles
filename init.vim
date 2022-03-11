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

source ~/.config/nvim/settings.vim 
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/autocmds.vim
" lua require("user.options")
" lua require("user.mappings")
lua require("user.plugins")

" Choose colorscheme
color gruvbox8_hard
