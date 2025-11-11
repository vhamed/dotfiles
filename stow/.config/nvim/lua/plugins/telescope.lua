return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
		},
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
	},
	config = function()
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		require("telescope").setup({
			defaults = {
				set_env = { ["COLORTERM"] = "truecolor" },
				mappings = {
					i = {
						["<c-c>"] = false,
						["<esc>"] = require("telescope.actions").close,
						["<C-i>"] = require("telescope.actions").select_horizontal,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
					n = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>su", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>st", builtin.colorscheme, { desc = "[S]earch [T]hemes" })
		vim.keymap.set("n", "<leader>so", builtin.buffers, { desc = "[S] in [O]pen buffers" })

		-- vim.keymap.set("v", "<leader>f", function()
		-- 	local originalText = vim.getVisualSelection()
		-- 	local text = string.gsub(originalText, "%(", "\\(")
		-- 	builtin.live_grep({
		-- 		default_text = text,
		-- 		prompt_title = string.format("Find word (%s)", text),
		-- 	})
		-- end, { desc = "[F]ind hightlighted text" })
		--
		local getVisualSelection = function()
			vim.cmd('noau normal! ""')
			local text = vim.fn.getreg("v")
			vim.fn.setreg("v", {})

			text = string.gsub(text, "\n", "") -- text is always "" for v mode
			if #text > 0 then
				return text
			else
				return vim.fn.expand("<cword>") or ""
			end
		end

		vim.keymap.set("v", "<leader>f", function()
			local text = getVisualSelection()

			builtin.live_grep({
				default_text = text,
				prompt_title = string.format("Find: %s", text),
			})
		end, { desc = "[F]ind highlighted text" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>s.", function()
			builtin.find_files({
				hidden = true,
				cwd = "~/Repos/dotfiles",
			})
		end, { desc = "[S]earch [.]files" })
	end,
}
