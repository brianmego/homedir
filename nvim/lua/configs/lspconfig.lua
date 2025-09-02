require("neodev").setup({})

local on_attach = function(client, bufnr)
    if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
lspconfig.pyright.setup {}
lspconfig.jsonls.setup {}
lspconfig.clangd.setup {}
-- lspconfig.basedpyright.setup {
--     -- settings = {
--     --     basedpyright = {
--     --         analysis = {
--     --             diagnosticMode = "openFilesOnly",
--     --             -- typeCheckingMode = "strict",
--     --             -- diagnosticSeverityOverrides = {
--     --             --     reportImplicitRelativeImport = "information"

--     --             -- }
--     --         }
--     --     }
--     -- }
-- }
lspconfig.ts_ls.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.csharp_ls.setup {}

lspconfig.ruff.setup {
    on_attach = on_attach,
    init_options = {
        settings = {
            format = {
                args = { "--preview" }
            },
            lint = {
                args = { "--preview" },
            }
        }
    }
}
lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {},
    },
}
