"  _________________
" < global mappings >
"  -----------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
nnoremap <C-t>     :tabnew<CR>
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>vs :vnew<cr>
nnoremap <silent> <leader>hs :new<cr>
nnoremap <silent> <leader>0 :tabmove 0<cr>
nnoremap <silent> <leader>h :noh<cr>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>/ y/<C-r>"<cr>


"  ___________________
" < coc-nvim mappings >
"  -------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"                 
" normal mode
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>rr <Plug>(coc-rename)
nmap <silent> <F2> <Plug>(coc-rename)
nmap <silent> <leader>cr :CocRestart<cr>
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>= :CocCommand prettier.formatFile<cr>
nmap <silent> <leader>ec :CocConfig<cr>
" insert mode
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"  ______________
" < git mappings >
"  --------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
nnoremap <leader>g :G<cr>
nnoremap <leader>gg :G<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gb :BlamerToggle<cr>



"  ______________________
" < filebrowser mappings >
"  ----------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
" nnoremap <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>n :NvimTreeToggle<CR>



"  _____________________
" < quick-open mappings >
"  ---------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files({previewer = false, layout_config={width=80}, hidden = true})<cr>
" nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>gp <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>d <cmd>lua search_dotfiles()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').colorscheme()<cr>


"  ______________________
" < indentation mappings >
"  ----------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
nnoremap <silent> <leader>in :IndentLinesToggle<cr>


"  ____________________
" < vim-align mappings >
"  --------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
xmap ga <Plug>(EasyAlign)    " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
