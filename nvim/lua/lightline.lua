local M = {}
function M.setup()
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

end
return M
