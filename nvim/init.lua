local o = vim.opt

o.nu = true
o.relativenumber = true 

o.scrolloff = 8
o.incsearch = true

require("plugins")

-- how to setup/use
-- https://linovox.com/install-and-use-nvim-cmp/
require('nvim-cmp')
