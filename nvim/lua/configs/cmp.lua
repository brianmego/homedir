local cmp = require("cmp")

-- local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "vsnip" },
        { name = "ultisnips" }, -- snippets
    -- }, {
    --     { name = "buffer" }, -- text within current buffer
    --     { name = "path" }, -- file system paths
    }),
    -- configure lspkind for vs-code like pictograms in completion menu
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         maxwidth = 50,
    --         ellipsis_char = "...",
    --     }),
    -- },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline({ ':' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" }
    })
    -- sources = cmp.config.sources({
    --     { name = "path" }
    -- }, {
    --     { name = "cmdline" }
    -- })
})

