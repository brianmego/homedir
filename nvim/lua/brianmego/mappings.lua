local function map(kind, lhs, rhs, opts)
	-- Possible Kinds:
	-- '' - normal, visual, select, operator pending (noremap)
	-- n  - normal mode
	-- v  - visual mode
	-- i  - insert mode
	-- c  - command line
	-- More details in :h map-table
	vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
	-- More details in :h nvim_set_keymap
end
local silentnoremap = {noremap = true, silent = true}

map('n',  'H', '^', silentnoremap)
map('n', 'L', '$', silentnoremap)
map('i', 'jk', '<esc>', silentnoremap)
map('n', '<C-J>', '<C-W><C-J>', silentnoremap)
map('n', '<C-K>', '<C-W><C-K>', silentnoremap)
map('n', '<C-L>', '<C-W><C-L>', silentnoremap)
map('n', '<C-H>', '<C-W><C-H>', silentnoremap)

--Searching
map('n', '<C-P>', ':Telescope find_files<CR>', silentnoremap)
map('n', '<C-F>', ':Telescope live_grep<CR>', silentnoremap)
map('n', '<leader>b', ':Telescope buffers<CR>', silentnoremap)

map('n', '<leader>j', ':%!jq . -<CR>', silentnoremap)
map('n', '<leader>s', ':Git<CR>', silentnoremap)
map('n', '<leader>w', ':w<CR>', silentnoremap)
map('n', '<leader>q', ':q<CR>', silentnoremap)
--copy current path to clipboard
map('n', '<leader>p', ':let @*=@%<CR>', silentnoremap)
map('n', '<leader>i', 'obreakpoint()<esc>', silentnoremap)
map('n', '<leader>x', ':%!xmllint --format -<CR>', silentnoremap)
map('n', '<leader>,', 'f,a<CR><esc>', silentnoremap)
map('n', '<leader>.', 't.a<CR><esc>l', silentnoremap)
map('n', '-', '<CMD>Oil<CR>', silentnoremap)
map('', '<leader>>', ':IndentLinesToggle<CR>', silentnoremap)
vim.api.nvim_del_keymap('', 'Y')
map('', '<leader>S', ':vsp ~/.config/nvim/init.lua<CR>', {noremap=true})

map('n', '<leader>T', ':TagbarToggle<CR>', silentnoremap)
map('n', '<Up>', ':resize +2<CR>', silentnoremap)
map('n', '<Down>', ':resize -2<CR>', silentnoremap)
map('n', '<Left>', ':vertical resize -2<CR>', silentnoremap)
map('n', '<Right>', ':vertical resize +2<CR>', silentnoremap)

map('n', '<leader>a', ':Lspsaga code_action<CR>', silentnoremap)
map('v', '<leader>a', ':Lspsaga code_action<CR>', silentnoremap)
map('n', '<leader>r', ':Lspsaga rename<CR>', silentnoremap)


--###LSP###
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
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>D', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end, opts)
        -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>h', function()
            vim .lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
--###LSP###
