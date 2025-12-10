return {
  -- require("lspconfig").nixd.setup({
  vim.lsp.config('nixd', {
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
  });
  vim.lsp.enable('nixd')
}
