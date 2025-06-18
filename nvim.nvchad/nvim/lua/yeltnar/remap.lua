vim.g.mapleader = " "
vim.keymap.set('n', "<leader>ex", vim.cmd.Ex)

vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = "Resume last Telescope picker" })
