return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config | fun(): AutoSession.Config
  opts = function()
    local local_dir_name = ".nvim_session_data"
    local cwd = vim.fn.getcwd()
    -- Check if the directory exists in the current working directory
    -- Note: 'd' checks specifically for a directory
    local is_local_mode = vim.fn.isdirectory(cwd .. "/" .. local_dir_name) == 1
    -- Set the root to the local dir if present, otherwise use the global default
    local session_root = is_local_mode
      and (cwd .. "/" .. local_dir_name .. "/")
      or (vim.fn.stdpath("data") .. "/sessions/")
    return {
      auto_session_root_dir = session_root,
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      auto_save_enabled = true,
      auto_restore_enabled = true,
      -- log_level = 'debug',
    }
  end
}

