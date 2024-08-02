local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer =      bufnr})
end)


-- TOOD set it up 

-- lsp_zero.ensure_installed({
-- 	'tsserver',
-- 	'eslint',
-- })
