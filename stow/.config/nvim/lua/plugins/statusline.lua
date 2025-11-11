return {

		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
				icons_enabled = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename", { "diagnostics" } },
				lualine_x = { "fileformat", "filetype", "diff" },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		},

}
