require("yeltnar.remap")

local o = vim.opt

o.nu = true
o.relativenumber = true 
o.scrolloff = 8
o.incsearch = true

vim.filetype.add({
  extension = {	
    bashrc = 'bash'
  }
});

print("hello from yeltnar")
