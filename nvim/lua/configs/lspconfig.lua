local on_attach = function(client, bufnr)
    if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

-- Setup language servers.
local lsp = vim.lsp
lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
lsp.enable("lua_ls")
lsp.enable("pyright")
lsp.enable("jsonls")
lsp.enable("clangd")
lsp.enable("ts_ls")
lsp.enable("tailwindcss")
lsp.enable("csharp_ls")

lsp.enable("ruff")
lsp.config("ruff", {
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
})

lsp.enable("rust_analyzer")
lsp.config("rust_analyzer", {
     settings = {
        ['rust-analyzer'] = {
            check = { command = "clippy" }
        },
     },
})

-- lsp.enable("basedpyright")
-- lsp.config("basedpyright", {
--      settings = {
--          basedpyright = {
--              analysis = {
--                  diagnosticMode = "openFilesOnly",
--                  -- typeCheckingMode = "strict",
--                  -- diagnosticSeverityOverrides = {
--                  --     reportImplicitRelativeImport = "information"

--                  -- }
--              }
--          }
--      }
-- })
