vim.g.mapleader = ","
local opts = { silent = true, noremap = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local new_vertical_split = ":vnew<cr>"

--------------------------------------------------
-- Key mappings
--------------------------------------------------
keymap("n", "<C-t>"     , ":tabnew<CR>", opts)  -- open new tab
keymap("n", "<leader>ev", ":tabnew $MYVIMRC<cr>", opts) -- edit vimrc
keymap("n", "<leader>sv", ":source $MYVIMRC<cr>", opts) --  reload vimrc
keymap("n", "<leader>vs", new_vertical_split, opts) -- new vertical split
keymap("n", "<leader>hs", ":new<cr>", opts) -- new horizontal split
keymap("n", "<leader>0" , ":tabmove 0<cr>", opts) -- move tab to the 
keymap("n", "<leader>h" , ":noh<cr>", opts)
keymap("v", "<leader>r" , "hy:%s/<C-r>h//gc<left><left><left>", opts)
keymap("v", "<leader>/" , 'y/<C-r>"<cr>', opts)
keymap("t", "<leader>q", "<C-\\><C-n>", opts)

--------------------------------------------------
-- Coc-nvim
--------------------------------------------------
function next_item()
  if vim.fn.pumvisible() then
    return utils.esc('<C-n>')
  end
  return utils.esc('<TAB>')
end
function previous_item()
  if vim.fn.pumvisible() then
    return utils.esc('<C-p>')
  end
  return utils.esc('<TAB>')
end
keymap("n", "<leader>gd", "<Plug>(coc-definition)", term_opts) 
keymap("n", "<leader>rr", "<Plug>(coc-rename)", term_opts) 
keymap("n", "<F2>", "<Plug>(coc-rename)", term_opts) 
keymap("n", "<leader>cr", ":CocRestart<cr>", term_opts) 
keymap("n", "<leader>[", "<Plug>(coc-diagnostic-prev)", term_opts) 
keymap("n", "<leader>]", "<Plug>(coc-diagnostic-next)", term_opts) 
keymap("n", "<leader>=", ":CocCommand prettier.formatFile<cr>", term_opts) 
keymap("n", "<leader>ec", ":CocConfig<cr>", term_opts) 
keymap("i", "<expr><Tab>", "v:lua.next_item()", { expr = true, noremap = false }) 
keymap("i", "<expr><S-Tab>", "v:lua.previous_item()", { expr = true, noremap = false }) 

-- imap <C-space> <Plug>(coc-snippets-expand)
-- vmap <C-j> <Plug>(coc-snippets-select)
-- imap <C-j> <Plug>(coc-snippets-expand-jump)
-- inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              -- \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



--------------------------------------------------
--  vim-vigutive 
--------------------------------------------------
keymap("n" ,"<leader>g ", ":G<cr>", opts)
keymap("n" ,"<leader>gg", ":G<cr>", opts)
keymap("n" ,"<leader>gj", ":diffget //3<cr>", opts)
keymap("n" ,"<leader>gf", ":diffget //2<cr>", opts)
keymap("n" ,"<leader>gb", ":BlamerToggle<cr>", opts)



--------------------------------------------------
--  filebrowser
--------------------------------------------------
-- keymap("n", "<leader>n", "<plug>NERDTreeTabsToggle<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)



--------------------------------------------------
--  quick-open
--------------------------------------------------
keymap("n", "<leader>p", "<cmd>lua require('telescope.builtin').find_files({previewer = false, layout_config={width=80}, hidden = true})<cr>", opts)  
-- keymap("n", "<leader>p", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts) nnoremap  
keymap("n", "<leader>gp", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)  
keymap("n", "<leader>gl", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)  
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)  
keymap("n", "<leader>d", "<cmd>lua search_dotfiles()<cr>", opts)  
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)  
keymap("n", "<leader>t", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)  


--------------------------------------------------
--  toggle indentation
--------------------------------------------------
keymap("n", "<leader>in", ":IndentLinesToggle<cr>", opts)  


--------------------------------------------------
--  vim-align 
--------------------------------------------------
keymap("x", "ga", "<Plug>(EasyAlign)", term_opts)  
keymap("n", "ga", "<Plug>(EasyAlign)", term_opts)  
