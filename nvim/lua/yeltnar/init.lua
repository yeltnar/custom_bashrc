require("yeltnar.remap")

local o = vim.opt


-- o.clipboard = "unnamed"
o.clipboard = ""

o.nu = true
o.relativenumber = true
o.scrolloff = 8
o.incsearch = true

vim.filetype.add({
  extension = {
    bashrc = 'bash'
  }
});

function ChangeToGitRoot(should_print)
  if should_print == nil then should_print = true end
  -- Check if the current directory is inside a Git repository
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel 2>/dev/null')[1]

  -- If git_root is not empty, it means we are in a Git repository
  if git_root and git_root ~= "" then
    -- Change to the Git root directory
    vim.cmd("cd " .. vim.fn.fnameescape(git_root))
    to_print = "cd " .. git_root
  end

  if should_print then
    print(to_print)
  end
  return to_print
end

-- You can then map this function to a keybinding, for example:
vim.api.nvim_set_keymap('n', '<leader>gr', ':lua ChangeToGitRoot()<CR>', { noremap = true, silent = true })
-- local txt=ChangeToGitRoot(false)
local txt=nil
local joiner=""
if txt ~= nil then joiner = "; " else txt="" end

print("hello from yeltnar" .. joiner .. txt)
