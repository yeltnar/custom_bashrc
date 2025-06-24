vim.g.mapleader = " "
vim.keymap.set('n', "<leader>ex", vim.cmd.Ex)

-- vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = "Resume last Telescope picker" })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = "Resume last Telescope picker" })

-- toggle comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true, desc = "Toggle comment selection" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment selection" })

-- for todo-comments
vim.keymap.set("n", "]t", function()  require("todo-comments").jump_next()end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()  require("todo-comments").jump_prev()end, { desc = "Previous todo comment" })-- You can also specify a list of valid jump keywords
vim.keymap.set("n", "<leader>gn", function()  require("todo-comments").jump_next({keywords = { "TODO" }})end, { desc = "Next todo comment" })
vim.keymap.set("n", "<leader>gp", function()  require("todo-comments").jump_prev({keywords = { "TODO" }})end, { desc = "Previous todo comment" })-- You can also specify a list of valid jump keywords
-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })
