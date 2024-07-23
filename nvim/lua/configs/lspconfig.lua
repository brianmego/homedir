require("neodev").setup({})

local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.csharp_ls.setup {}

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
    init_options = {
        settings = {
            format = {
                args = {"--preview"}
            },
            lint = {
                args = { "--preview" },
            }
        }
    }
}
-- lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {},
    },
}
