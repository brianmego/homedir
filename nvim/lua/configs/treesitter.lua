local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "bash", "hcl", "html", "javascript", "lua", "python", "rust", "vim", "vimdoc", "sql", "regex", "rst" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    modules = {},
    ignore_install = {},
    auto_install = true
})

