require("options")
require("keymaps")
require("autocmds")
require("lazy_init")

vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { desc = "Fu[G]itive [G]it status" })
vim.keymap.set("n", "<leader>gp", "<cmd>G pull<cr>", { desc = "[G]it [P]ull" })
vim.keymap.set("n", "<leader>gf", "<cmd>G fetch<cr>", { desc = "[G]it [F]etch" })
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<cr>", { desc = "[G]it get [R]ight diff" })
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<cr>", { desc = "[G]it get [L]eft diff" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
