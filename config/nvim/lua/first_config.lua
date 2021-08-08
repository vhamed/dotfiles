search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/Repos/dotfiles",
    })
end
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    layout_config = {
      vertical = {
        width = 0.9
      }
    },
    prompt_prefix = "  ",
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- default
    -- file_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<c-c>"] = false,
        ["<esc>"] = actions.close,

        -- Otherwise, just set the mapping to the function that you want it to be.
        ["<C-i>"] = actions.select_horizontal,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  }
}
require('telescope').load_extension('fzf')
require('lualine').setup({
  theme = 'gruvbox',
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype', 'diff'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'nvim-tree', 'fugitive', 'quickfix'},
})
local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}

-- indent_blankline plugin
vim.g.indent_blankline_char = "│" -- 
vim.g.indent_blankline_show_foldtext = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_filetype_exclude = {
  "startify",
  "dashboard",
  "log",
  "fugitive",
  "gitcommit",
  "packer",
  "vimwiki",
  "markdown",
  "json",
  "txt",
  "vista",
  "help",
  "NvimTree",
  "git",
  "TelescopePrompt",
  "undotree",
  "flutterToolsOutline",
  "org",
  "orgagenda",
  "", -- for all buffers without a file type
}
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_context_patterns = {
  "class",
  "function",
  "method",
  "block",
  "list_literal",
  "selector",
  "^if",
  "^table",
  "if_statement",
  "while",
  "for",
}
-- require("nvim-treesitter.configs").setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true,
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       -- mappings for incremental selection (visual mappings)
--       init_selection = "<leader>v", -- maps in normal mode to init the node/scope selection
--       node_incremental = "<leader>v", -- increment to the upper named parent
--       node_decremental = "<leader>V", -- decrement to the previous node
--       scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
--     },
--   },
--   indent = {
--     enable = true,
--   },
--   textobjects = {
--     lookahead = true,
--     select = {
--       enable = true,
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         ["ic"] = "@class.inner",
--         ["aC"] = "@conditional.outer",
--         ["iC"] = "@conditional.inner",
--       },
--     },
--     swap = {
--       enable = true,
--       swap_next = {
--         ["[w"] = "@parameter.inner",
--       },
--       swap_previous = {
--         ["]w"] = "@parameter.inner",
--       },
--     },
--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         ["]m"] = "@function.outer",
--         ["]]"] = "@class.outer",
--       },
--       goto_previous_start = {
--         ["[m"] = "@function.outer",
--         ["[["] = "@class.outer",
--       },
--     },
--   },
--   textsubjects = {
--     enable = true,
--     keymaps = {
--       ["<CR>"] = "textsubjects-smart",
--     },
--   },
--   rainbow = {
--     enable = true,
--     disable = { "lua", "json" },
--     colors = {
--       "royalblue3",
--       "darkorange3",
--       "seagreen3",
--       "firebrick",
--       "darkorchid3",
--     },
--   },
--   autopairs = { enable = true },
--   query_linter = {
--     enable = true,
--     use_virtual_text = true,
--     lint_events = { "BufWrite", "CursorHold" },
--   },
-- }
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.denols.setup{}
-- require'lspconfig'.tsserver.setup{}
