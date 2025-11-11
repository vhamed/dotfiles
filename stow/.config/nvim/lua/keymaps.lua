-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "open new [T]ab" })
vim.keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC<cr>", { desc = "[E]edit [V]imrc" })
vim.keymap.set("n", "<leader>vs", "<cmd>vnew<cr>", { desc = "open [V]ertial [S]plit" })
vim.keymap.set("n", "<leader>hs", "<cmd>new<cr>", { desc = "open [H]orizontal [S]plit" })
vim.keymap.set("n", "<leader>0", "<cmd>tabmove 0<cr>", { desc = "move tab to [0] position" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "[N]o [H]ighlight" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("v", "<leader>r", "hy:%s/<C-r>h//gc<left><left><left>", { desc = "[R]eplace selection" })
vim.keymap.set("v", "<leader>/", 'y/<C-r>"<cr>', { desc = "[/] find selection" })
vim.keymap.set("t", "<leader>q", "<C-\\><C-n>", { desc = "[Q] quit nvim terminal" })
vim.keymap.set(
	"n",
	"<leader>cc",
	"<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>",
	{ desc = "[C][C] Tmux-Sessionizer" }
)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
