-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.yml.j2",
    callback = function()
        vim.bo.filetype = "yaml"
    end,
    desc = "Set filetype for YAML Jinja2 templates to yaml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.conf.j2",
    callback = function()
        vim.bo.filetype = "nginx"
    end,
    desc = "Set filetype for conf Jinja2 templates to yaml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*env.j2",
    callback = function()
        vim.bo.filetype = "bash"
    end,
    desc = "Set filetype for env Jinja2 templates to yaml",
})
