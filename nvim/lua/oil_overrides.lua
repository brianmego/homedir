require('oil').setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    keymaps = {
        ["<C-p>"] = false,
        ["<C-h>"] = false,
        ["<C-v>"] = false,
        ["gp"] = "actions.preview",
        ["<C-l>"] = false
    }
})
