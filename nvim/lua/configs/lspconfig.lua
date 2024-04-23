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


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[opts.buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- vim.lsp.inlay_hint.enable(opts.buffer, true)

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- vim.api.nvim_set_hl(opts.buffer, "LspinlayHint", { fg="grey", })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>h', function()
            vim.lsp.inlay_hint(opts.buffer)
        end, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
