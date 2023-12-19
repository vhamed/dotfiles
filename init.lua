vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- :u | e ++ff=dos
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    'tpope/vim-fugitive',
  },

  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-eunuch',
  'tpope/vim-repeat',
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  'christoomey/vim-tmux-navigator',

  {
    'kyazdani42/nvim-tree.lua',
    keys = {
      -- { "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "[N]vimTree Toggle" },
      { "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>", desc = "[N]vimTree Find File" },
    },
    config = true,
  },

  {
    'APZelos/blamer.nvim',
    keys = {
      { "<leader>gb", "<cmd>:BlamerToggle<cr>", desc = "[G]it [B]lame" },
    },
    config = true,
  },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- {
  --   -- Adds git releated signs to the gutter, as well as utilities for managing changes
  --   'lewis6991/gitsigns.nvim',
  --   opts = {
  --     -- See `:help gitsigns.txt`
  --     signs = {
  --       add = { text = '+' },
  --       change = { text = '~' },
  --       delete = { text = '_' },
  --       topdelete = { text = '‾' },
  --       changedelete = { text = '~' },
  --     },
  --     on_attach = function(bufnr)
  --       vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]itsigns [N]ext Hunk' })
  --       vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]itsigns [P]revious Hunk' })
  --       vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[G]itsigns preview [H]unk' })
  --     end,
  --   },
  -- },

  {
    'lifepillar/vim-gruvbox8',
    priority = 1000,
    enabled = true,
    config = function()
      vim.cmd.colorscheme 'gruvbox8_hard'
      vim.cmd([[hi SignColumn ctermbg=NONE guibg=NONE]])
      vim.cmd([[hi normal guibg=NONE]])
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        globalstatus = true,
        icons_enabled = false,
        theme = 'gruvbox_dark',
        component_separators = '|',
        component_separators = '🛻',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '🛻', right = '🛻' },
        component_separators = { left = '🛻', right = '🛻' },
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename', { 'diagnostics' }},
        lualine_x = {'fileformat', 'filetype', 'diff'},
        lualine_y = {'location'},
        lualine_z = {'progress'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    },
  },

  { 
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} 
  },

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}, {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- [[ Setting options ]]
vim.o.hlsearch = true
vim.o.showmatch = true

vim.opt.swapfile = false

vim.o.cursorline = true

vim.wo.number = true
vim.o.relativenumber = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "open new [T]ab" })
vim.keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC<cr>", { desc = "[E]edit [V]imrc" })
vim.keymap.set("n", "<leader>vs", "<cmd>vnew<cr>", { desc = "open [V]ertial [S]plit" })
vim.keymap.set("n", "<leader>hs", "<cmd>new<cr>", { desc = "open [H]orizontal [S]plit" })
vim.keymap.set("n", "<leader>0", "<cmd>tabmove 0<cr>", { desc = "move tab to [0] position" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "[N]o [H]ighlight" })

-- vim.keymap.set("n", "<leader>rg", function() print(":cfdo %s/old/new/ge \\| update") end, { desc = "[R]eplace [G]lobal" })
-- vim.keymap.set("n", "<leader>rg" , "<cmd>cfdo %s/old/new/ge \\| update", { desc = "[R]eplace [G]lobal" })
-- vim.keymap.set("n", "<leader>rg" , vim.cmd(vim.print("cfdo %s/old/new/ge | update")))
-- vim.keymap.set("n", "<leader>rg" , vim.cmd('echo 42') , { desc = "[R]eplace [G]lobal" })
-- vim.keymap.set("n", "<leader>rg" , vim.cmd { cmd = "cfdo", args = { "%s/old/new/ge" }}, { desc = "[R]eplace [G]lobal"})

vim.keymap.set("v", "<leader>r", "hy:%s/<C-r>h//gc<left><left><left>", { desc = "[R]eplace selection" })
vim.keymap.set("v", "<leader>/", 'y/<C-r>"<cr>', { desc = "[/] find selection" })
vim.keymap.set("t", "<leader>q", "<C-\\><C-n>", { desc = "[Q] quit nvim terminal" })
vim.keymap.set("n", "<leader>cc", "<cmd>silent !tmux neww ~/.local/scripts/tmux-sessionizer<CR>", { desc = "[C][C] Tmux-Sessionizer" })


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure nvim-tree ]]
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
    }
  },
  filters = {
    dotfiles = true,
  },
})

-- [[ Configure Telescope ]]
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = {
        width = 0.9
      }
    },
    prompt_prefix = "  ",
    prompt_prefix = " ♫ ",
    prompt_prefix = ' 🛻 ',
    file_ignore_patterns = { ".git", "dotbot", "package-lock.json" },
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<c-c>"] = false,
        ["<esc>"] = actions.close,

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

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


vim.keymap.set('n', '<leader>gg',  "<cmd>G<cr>", { desc = "Fu[G]itive [G]it status" })
vim.keymap.set('n', '<leader>gp',  "<cmd>G pull<cr>", { desc = "[G]it [P]ull" })
vim.keymap.set('n', '<leader>gf',  "<cmd>G fetch<cr>", { desc = "[G]it [F]etch" })
vim.keymap.set('n', '<leader>gl', '<cmd>diffget //3<cr>', { desc = "[G]it get [R]ight diff" })
vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<cr>', { desc = "[G]it get [L]eft diff" })

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').git_branches, { desc = '[S]earch git [B]ranches' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').buffers, { desc = '[S]earch [O]pen buffers' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').colorscheme, { desc = '[S]earch [T]hemes' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_stash, { desc = '[S]earch [S]tash' })

vim.keymap.set('n', '<leader>f', require('telescope.builtin').live_grep, { desc = '[F]ind' })
vim.keymap.set('v', '<leader>f', function()
	local originalText = vim.getVisualSelection();
  local text = string.gsub(originalText, "%(", "\\(");
  require('telescope.builtin').live_grep({
    default_text = text,
    prompt_title = string.format('Find word (%s)', text),
  })
end, { desc = '[F]ind hightlighted text' })
vim.keymap.set('n', '<leader>su', require('telescope.builtin').grep_string, { desc = '[S]earch word [U]nder cursor' })
vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').find_files({
    prompt_title = "Dotfiles",
    cwd = "$HOME/Repos/dotfiles",
  })
end, { desc = 'Fuzzily [S]earch in [D]otfiles' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'javascript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  -- indent = { enable = true },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = '<c-space>',
  --     node_incremental = '<c-space>',
  --     scope_incremental = '<c-s>',
  --     node_decremental = '<M-space>',
  --   },
  -- },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ['aa'] = '@parameter.outer',
  --       ['ia'] = '@parameter.inner',
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ['<leader>a'] = '@parameter.inner',
  --     },
  --     swap_previous = {
  --       ['<leader>A'] = '@parameter.inner',
  --     },
  --   },
  -- },
}

-- [[ Diagnostic keymaps ]]
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = false,
    }
  )
end

setup_diags()

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
  vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
  vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
  vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
end

-- Enable the following language servers
--
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require('refactoring').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
