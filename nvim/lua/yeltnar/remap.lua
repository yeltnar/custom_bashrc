vim.g.mapleader = " "
vim.keymap.set('n', "<leader>ex", vim.cmd.Ex)

-- vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = "Resume last Telescope picker" })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = "Resume last Telescope picker" })

-- toggle comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true, desc = "Toggle comment selection" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment selection" })

