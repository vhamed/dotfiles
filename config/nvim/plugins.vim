"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => List plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'hoob3rt/lualine.nvim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'duggiefresh/vim-easydir'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/vim-easy-align'
Plug 'raimondi/delimitmate'
Plug 'tmhedberg/matchit'
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-commentary'
" Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/terminus'
Plug 'stanangeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'  
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sindrets/diffview.nvim'
Plug 'APZelos/blamer.nvim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_node_path="~/.nvm/versions/node/v16.13.0/bin/node"
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-phpls', 'coc-snippets', 'coc-prettier']
let g:coc_disable_startup_warning = 1
imap <C-space> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gruvbox colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ayu colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let ayucolor="dark"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Onedark colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:onedark_terminal_italics=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => One colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:one_allow_italics = 1 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.js"
au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Delimitmate 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_enabled = 1
" let g:indentLine_char = '│' " let g:indentLine_char = '┊'
" let g:indentLine_bufTypeExlude = ['Nerd_tree.*']
" let g:indentLine_fileTypeExclude = ['help', 'markdown', 'reason']
" let g:vim_json_syntax_conceal = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nvim-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:nvim_tree_width = 30 "30 by default
" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:nvim_tree_gitignore = 1 "0 by default
" let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
" let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
" let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:nvim_tree_indent_markers = 0 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
" let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
" let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
" let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
" let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
" let g:nvim_tree_icon_padding = '  ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
" let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
" let g:nvim_tree_window_picker_exclude = {
"     \   'filetype': [
"     \     'packer',
"     \     'qf'
"     \   ],
"     \   'buftype': [
"     \     'terminal'
"     \   ]
"     \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
" let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_show_icons = {
"     \ 'git': 0,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ 'folder_arrows': 1,
"     \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
" let g:nvim_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★",
"     \   'deleted': "",
"     \   'ignored': "◌"
"     \   },
"     \ 'folder': {
"     \   'arrow_open': "",
"     \   'arrow_closed': "",
"     \   'default': "",
"     \   'open': "",
"     \   'empty': "",
"     \   'empty_open': "",
"     \   'symlink': "",
"     \   'symlink_open': "",
"     \   },
"     \   'lsp': {
"     \     'hint': "",
"     \     'info': "",
"     \     'warning': "",
"     \     'error': "",
"     \   }
"     \ }
" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ctrlp_map = '<leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 't'
set wildignore+=*/vendor/*,*/node_modules/*,*/tmp/*,*/dist/*,*/.next/*,*.so,*.swp,*.zip,*.mp3,*.mp4,*.ogg,*.pdf,*.jpg,*.jpeg,*.gif,*.deb,*.webm,*.mkv,*.jsc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeMinimalUI=1
" let NERDTreeIgnore = ['\.jsc$']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_detect_paste = 0
" let g:airline_detect_crypt = 0
" let g:airline_detect_spell = 0
" let g:airline#extensions#ale#enabled = 0
" let g:airline#extensions#ctrlspace#enabled = 0
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#coc#enabled = 0
" let g:airline#extensions#csv#enabled = 0
" let g:airline#extensions#cursormode#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline_theme='solarized_flood'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-php-namespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:webdevicons_enable_ctrlp = 1
" let g:webdevicons_enable_nerdtree = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent-blankline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight IndentBlanklineSpaceChar guifg=#FF0000 gui=nocombine
" highlight IndentBlanklineSpaceCharBlankline guifg=#00FF00 gui=nocombine
" highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine
" let g:indent_blankline_char_highlight = "#FF0000"
" let g:indentLine_char = '│'
" let g:indent_blankline_char = "│"
" let g:indent_blankline_filetype_exclude = [ "help", "defx", "vimwiki", "man", "gitmessengerpopup", "diagnosticpopup" ]
" let g:indent_blankline_buftype_exclude = ["terminal"]
" let g:indent_blankline_space_char_blankline = " "
" let g:indent_blankline_strict_tabs = v:true
" let g:indent_blankline_debug = v:true
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_context_patterns = ["class", "function", "method", "^if", "while", "for", "with", "func_literal", "block", "try", "except", "argument_list", "object", "dictionary" ]
