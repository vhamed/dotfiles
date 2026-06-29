vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- [[ Setting options ]]
vim.o.hlsearch = true
vim.o.showmatch = true

vim.opt.swapfile = false

vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

vim.o.confirm = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.mouse = "a"

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.opt.laststatus = 3

vim.o.breakindent = true

vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "no"

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 1000
vim.keymap.set("n", "s", "<Nop>")

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true
