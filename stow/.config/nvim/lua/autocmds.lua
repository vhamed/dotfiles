-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Set filetype for yml.j2 files to yaml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.yml.j2",
    callback = function()
        vim.bo.filetype = "yaml"
    end,
    desc = "Set filetype for YAML Jinja2 templates to yaml",
})

-- Set filetype for yml.j2 files to yaml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.conf.j2",
    callback = function()
        vim.bo.filetype = "nginx"
    end,
    desc = "Set filetype for YAML Jinja2 templates to yaml",
})
