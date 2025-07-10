return {
  -- :help oil
  -- :help oil-config
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function() 
    require("oil").setup(
      {
        columns = {
          "icon",
          -- "permissions",
          "size",
          "mtime",
        },
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          -- ["g?"] = { "actions.show_help", mode = "n" },
          -- ["<CR>"] = "actions.select",
          -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
          -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
          -- ["<C-p>"] = "actions.preview",
          -- ["<C-c>"] = { "actions.close", mode = "n" },
          -- ["<C-l>"] = "actions.refresh",
          -- ["-"] = { "actions.parent", mode = "n" },
          -- ["_"] = { "actions.open_cwd", mode = "n" },
          -- ["`"] = { "actions.cd", mode = "n" },
          -- ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          -- ["gs"] = { "actions.change_sort", mode = "n" },
          -- ["gx"] = "actions.open_external",
          -- ["g."] = { "actions.toggle_hidden", mode = "n" },
          -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = true,
          bufhidden = "hide",
        },
        view_options = {
          -- show_hidden = true,
          is_hidden_file = function(name, bufnr)
            -- don't hide any files 
            return false
          end,
        },
      }
    )
    vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open oil.nvim" })
  end
}
