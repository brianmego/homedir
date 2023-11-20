local M = {}
function M.setup()
    vim.cmd.highlight({"CocInlayHint", "guifg=grey"})
end
return M
