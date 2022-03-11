require "user.options"
require "user.mappings"
require "user.plugins"
require "first_config"


vim.cmd [[
try
  colorscheme gruvbox8_hard
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
