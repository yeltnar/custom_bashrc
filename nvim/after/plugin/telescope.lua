-- default leaderkey is `\` so `\ff` would find in all files... may have to to ctl+c a few times :shrug:
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("File grep > ") });
end)
