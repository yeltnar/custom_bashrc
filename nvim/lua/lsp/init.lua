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

require('lspconfig').pyright.setup({}),
vim.lsp.config('pyright', {}),

-- require("lspconfig").lua_ls.setup({
}
