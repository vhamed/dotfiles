local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- vim.g.coc_node_path = "~/.nvm/versions/node/v16.13.0/bin/node"
-- vim.g.coc_global_extensions = { 'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-phpls', 'coc-snippets', 'coc-prettier' }
-- vim.g.coc_disable_startup_warning = 1
-- vim.g.coc_snippet_next = '<c-j>'
-- vim.g.coc_snippet_prev = '<c-k>'


---------------------------------------------------------------
-- gruvbox colorscheme
---------------------------------------------------------------
vim.g.gruvbox_contrast_dark='hard'
vim.g.gruvbox_italic=1
vim.g.gruvbox_invert_selection=0

---------------------------------------------------------------
-- ayu colorscheme
---------------------------------------------------------------
-- let ayucolor="dark"


---------------------------------------------------------------
-- onedark colorscheme
---------------------------------------------------------------
-- let g:onedark_terminal_italics=1


---------------------------------------------------------------
-- one colorscheme
---------------------------------------------------------------
vim.g.one_allow_italics = 1 


---------------------------------------------------------------
-- vim-closetag
---------------------------------------------------------------
vim.g.closetag_filenames = { "*.xml,*.html,*.xhtml,*.phtml,*.js" }
-- au FileType xml,html,phtml,php,blade.php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"


---------------------------------------------------------------
-- delimitmate
---------------------------------------------------------------
vim.g.delimitMate_expand_cr = 1
-- au FileType mail let b:delimitMate_expand_cr = 1


---------------------------------------------------------------
-- Ctrlp
---------------------------------------------------------------
-- vim.g.ctrlp_map = '<leader>p'
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_open_multiple_files = 't'
vim.g.ctrlp_open_new_file = 't'
vim.opt.wildignore:append({ "*/vendor/*","*/node_modules/*","*/tmp/*","*/dist/*","*/.next/*","*.so","*.swp","*.zip","*.mp3","*.mp4","*.ogg","*.pdf","*.jpg","*.jpeg","*.gif","*.deb","*.webm","*.mkv","*.jsc" })



-- Install your plugins here
return packer.startup(function(use)
  use 'hoob3rt/lualine.nvim'
  use 'chriskempson/base16-vim'
  use 'morhetz/gruvbox'
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'lifepillar/vim-gruvbox8'
  use 'dracula/vim'
  use 'joshdick/onedark.vim'
  use 'rakr/vim-one'
  use 'altercation/vim-colors-solarized'
  use 'ayu-theme/ayu-vim'
  use 'tomasr/molokai'
  use 'tomlion/vim-solidity'
  use 'tpope/vim-fugitive'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'honza/vim-snippets'
  use 'duggiefresh/vim-easydir'
  use 'ctrlpvim/ctrlp.vim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-treesitter/nvim-treesitter'
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'junegunn/vim-easy-align'
  use 'raimondi/delimitmate'
  use 'tmhedberg/matchit'
  use 'alvan/vim-closetag' 
  use 'tpope/vim-commentary'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'wincent/terminus'
  use 'stanangeloff/php.vim'
  use 'jwalton512/vim-blade'
  use 'othree/html5.vim'
  use 'hail2u/vim-css3-syntax'
  use 'pangloss/vim-javascript'
  use 'maxmellon/vim-jsx-pretty'  
  use 'mustache/vim-mustache-handlebars'
  use 'tpope/vim-repeat'
  use 'mileszs/ack.vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'sindrets/diffview.nvim'
  use 'APZelos/blamer.nvim'
end)
