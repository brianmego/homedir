vim.g.lightline = {
    colorscheme = "one",
    active = {
        left = {
            {'mode', 'paste'},
            {'gitbranch', 'readonly', 'relativepath', 'modified'}
        }
    },
    component_function = {
        gitbranch = 'FugitiveHead'
    }
}
