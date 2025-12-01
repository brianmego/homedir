require("neodev").setup({})

local on_attach = function(client, bufnr)
    if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

-- Setup language servers.
local lspconfig = vim.lsp
lspconfig.enable("lua_ls")
lspconfig.enable("pyright")
lspconfig.enable("jsonls")
lspconfig.enable("clangd")
lspconfig.enable("ts_ls")
lspconfig.enable("tailwindcss")
lspconfig.enable("csharp_ls")

lspconfig.enable("ruff")
lspconfig.config("ruff", {
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

lspconfig.enable("rust_analyzer")
lspconfig.config("rust_analyzer", {
     -- Server-specific settings. See `:help lspconfig-all`
     settings = {
        ['rust-analyzer'] = {
            check = { command = "clippy" }
        },
     },
})

-- lspconfig.enable("basedpyright")
-- lspconfig.config("basedpyright", {
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
