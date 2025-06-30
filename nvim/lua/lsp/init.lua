return {
require("lspconfig").nixd.setup({
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        -- command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
        command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt or alejandra
      },
      -- options = {
      --   nixos = {
      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
      --   },
      --   home_manager = {
      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
      --   },
      -- },
    },
  },
}),

require("lspconfig").pyright.setup({}),

require("lspconfig").lua_ls.setup({
  cmd = {
    -- will use globla install when is not installed with Mason (better for nixos) 
    'lua-language-server',
  },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
})
}
