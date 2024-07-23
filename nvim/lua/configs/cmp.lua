local cmp = require("cmp")

local lspkind = require("lspkind")
local visibility = function(entry1, entry2)
    --function to check if entry is private (starts with _)
    local function is_private(entry)
        local label = entry.completion_item.label
        return label:sub(1, 1) == '_'
    end

    -- compare entries: prioritize public functions over private
    local entry1_private = is_private(entry1)
    local entry2_private = is_private(entry2)

    if entry1_private and not entry2_private then
        return false
    elseif not entry1_private and entry2_private then
        return true
    end

    -- if both are private or both are public, fall back to other comparators
    return nil
end


vim.g.cmptoggle = true
vim.keymap.set("n", "<leader>xo", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
cmp.setup({
    enabled = function()
        return vim.g.cmptoggle
    end,
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
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "ultisnips" },
        { name = "nvim_lsp" },
    }, {
        { name = "path" },
        { name = "buffer" },
    }),
    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    sorting = {
        comparators = {
            cmp.config.compare.exact,
            visibility,
            cmp.config.compare.kind,
        },
    },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})
